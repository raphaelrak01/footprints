import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output, State
import plotly.express as px
import pandas as pd
import sqlalchemy

# Connexion à la base de données
engine = sqlalchemy.create_engine("mysql+mysqlconnector://root:@localhost/suivi_etudiants")

# Importez les données des deux tables
df_etudiants = pd.read_sql("SELECT * FROM etudiants", con=engine)
df_connections = pd.read_sql("SELECT * FROM connections", con=engine)

# Créez l'application Dash
app = dash.Dash(__name__)

# Créez la mise en page du tableau de bord
app.layout = html.Div(
    style={'textAlign': 'center'},  # Center the content
    children=[
        html.Div([
            # Champ de saisie pour entrer l'ID de l'étudiant
            dcc.Input(
                id='etudiant-input',
                type='text',
                placeholder='Entrez l\'ID de l\'étudiant...',
                value='',  # Valeur par défaut
            ),
            # Bouton pour soumettre le formulaire
            html.Button('submit', id='submit-button', n_clicks=0),

            # Informations de l'étudiant dans un tableau
            html.Table(
                id='etudiant-info',
                # je veux un tableau donc je crée des balises <tr><th><td></td></th></tr>
                children=[
                    html.Tr([html.Th('Nom'), html.Td(id='nom-info')]),
                    html.Tr([html.Th('Prénom'), html.Td(id='prenom-info')]),
                    html.Tr([html.Th('Mention'), html.Td(id='mention-info')]),
                    html.Tr([html.Th('Note'), html.Td(id='note-info')]),
                    html.Tr([html.Th('Nombre de connexions'), html.Td(id='nb-connexions-info')]),
                    html.Tr([html.Th('Durée totale de connexion'), html.Td(id='duree-totale-info')]),
                ],
            ),
        ], style={'margin': 'auto', 'width': '50%'}),  # Center the inner content and set width
        # Graphique de l'assiduité
        dcc.Graph(
            id='assiduity-chart',
        ),
        # Pie Chart (camembert graphique)
        dcc.Graph(
            id='assiduity-pie-chart',
        ),
    ]
)

# Callback pour mettre à jour le texte et les graphiques en fonction de l'ID de l'étudiant entré
@app.callback(
    Output('nom-info', 'children'),
    Output('prenom-info', 'children'),
    Output('mention-info', 'children'),
    Output('note-info', 'children'),
    Output('nb-connexions-info', 'children'),
    Output('duree-totale-info', 'children'),
    Output('assiduity-chart', 'figure'),
    Output('assiduity-pie-chart', 'figure'),
    Input('submit-button', 'n_clicks'),
    State('etudiant-input', 'value')
)
def update_assiduity(n_clicks, input_value):
    if n_clicks > 0:
        try:
            selected_etudiant = int(input_value)
            # Vérifiez si l'ID de l'étudiant est dans la liste
            if selected_etudiant in df_etudiants['id_etudiant'].unique():
                # Filtrez les données de l'étudiant sélectionné
                filtered_df = df_connections[df_connections['id_etudiant'] == selected_etudiant]

                # Obtenez les informations de l'étudiant
                etudiant_info = df_etudiants[df_etudiants['id_etudiant'] == selected_etudiant].iloc[0]
                nom = etudiant_info['nom']
                prenom = etudiant_info['prenom']
                mention = etudiant_info['mention']
                note = etudiant_info['note']

                # Calculez le nombre de connexions et la durée totale
                nb_connexions = filtered_df.shape[0]
                duree_totale = filtered_df['duree'].sum()

                # Calculez la somme des durées de connexions de chaque jour
                duree_connexions_par_jour = filtered_df.groupby('date')['duree'].sum().reset_index(name='duree')

                # Créez le graphique de barres
                figure_bar = px.bar(
                    duree_connexions_par_jour,
                    x='date',
                    y='duree',
                    title=f"Durée des connexions de l'étudiant {nom} {prenom}"
                )

                # Créez le graphique en camembert (pie chart)
                figure_pie = px.pie(
                    duree_connexions_par_jour,
                    names='date',
                    values='duree',
                    title=f"Répartition de la durée des connexions de l'étudiant {nom} {prenom}"
                )

                return nom, prenom, mention, note, nb_connexions, f"{duree_totale} minutes", figure_bar, figure_pie
            else:
                raise ValueError(f"L'ID de l'étudiant {selected_etudiant} n'est pas valide.")
        except ValueError as e:
            return '', '', '', '', '', '', px.scatter(), px.scatter()  # Affichez des graphiques vides en cas d'erreur
    else:
        return '', '', '', '', '', '', px.scatter(), px.scatter()  # Affichez des graphiques vides au chargement initial

# Exécutez l'application Dash
if __name__ == '__main__':
    app.run_server(debug=True)
