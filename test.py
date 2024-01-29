import dash
import dash_core_components as dcc
import dash_html_components as html
from dash.dependencies import Input, Output
import plotly.express as px
import pandas as pd
import sqlalchemy

# Connexion à la base de données
engine = sqlalchemy.create_engine("mysql+mysqlconnector://root:@localhost/suivi_etudiants")

# Importez les données des deux tables
df_etudiants = pd.read_sql("SELECT * FROM etudiants", con=engine)
df_connections = pd.read_sql("SELECT * FROM connections", con=engine)

# Liste des étudiants pour la liste déroulante
etudiants_list = df_etudiants['id_etudiant'].unique()

# Créez l'application Dash
app = dash.Dash(__name__)

# Créez la mise en page du tableau de bord
app.layout = html.Div([
    # Liste déroulante pour sélectionner l'étudiant
    dcc.Dropdown(
        id='etudiant-dropdown',
        options=[{'label': etudiant, 'value': etudiant} for etudiant in etudiants_list],
        value=etudiants_list[0],  # Valeur par défaut
        multi=False
    ),
    # Texte affichant les informations de l'étudiant
    html.Div(id='etudiant-info', children=''),
    # Graphique de l'assiduité
    dcc.Graph(
        id='assiduity-chart'
    ),
])

# Callback pour mettre à jour le texte et le graphique en fonction de l'étudiant sélectionné
@app.callback(
    Output('etudiant-info', 'children'),
    Output('assiduity-chart', 'figure'),
    Input('etudiant-dropdown', 'value')
)
def update_assiduity(selected_etudiant):
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

    # Créez le texte d'information
    info_text = f"""
    L'étudiant {nom} {prenom} ({mention}) :

    - Nombre de connexions : {nb_connexions}
    - Durée totale de connexion : {duree_totale} minutes
    - Note : {note}
    """

    # Calculez la somme des durées de connexions de chaque jour
    duree_connexions_par_jour = filtered_df.groupby('date')['duree'].sum().reset_index(name='duree')

    # Créez le graphique
    figure = px.bar(
        # Utilisez la colonne 'duree' comme données pour le graphique
        duree_connexions_par_jour,
        x='date',
        y='duree',
        title=f"Durée des connexions de l'étudiant {nom} {prenom}"
    )

    # Retournez les résultats
    return info_text, figure

# Exécutez l'application Dash
if __name__ == '__main__':
    app.run_server(debug=True)
