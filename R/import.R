# Importation et remaniement des données
SciViews::R("model")

# Etape 1 : Importation des données brutes --------------------------------
lezards <- read("data/lezards.csv") |> janitor::clean_names()
lezards <- srename(lezards,
  body_condition = "body_cond",
  base_tail_circumference_btc = "circ_base_queue",
  btc_stl = "cbq/lt",
  body_size = "taille",
  eye_to_ear_length_eel = "long_oeil_oreille",
  eel_skull_length = "loo/lc",
  eel_stl = "loo/lt",
  skull_length_sl = "long_crane",
  sl_stl = "lc/lt",
  skull_width_sw = "larg_crane",
  sw_stl = "lac/lt",
  sw_sl = "lac/lc",
  snout_tail_length_stl = "long_tot",
  snout_vent_length_svl = "long_sans_queue",
  tail_length_tl = "long_queue",
  tl_stl = "lq/lt",
  thigh_width_tw = "larg_cuisse",
  tw_stl = "lacu/lt",
  weight = "masse",
  sex_male_0_female_1 = "sexe_male0_femelle1")
  

# Etape 2 : Description brève des données ---------------------------------



# Etape 3 : Nettoyage des données  ----------------------------------------



# Etape 4 : Ajout des labels et des unités --------------------------------

lezards <- labelise(lezards,
  label=list(
    body_cond = "",
    circ_base_queue = "Circonférence de la base de la queue",
    cbq/lt = "Circonférence de la base de la queue/Longueur totale",
    taille = "Taille",
    long_oeil_oreille = "Longueur de l'oeil à l'oreille",
    loo/lc = "Longueur de l'oeil à l'oreille/ Longueur du crâne",
    loo/lt = "Longueur de l'oeil à l'oreille/Longueur totale",
    long_crane = "Longueur du crâne",
    lc/lt = "Longueur du crâne/Longueur totale",
    larg_crane = "Largeur du crâne",
    lac/lt = "Largeur du crâne/Longueur totale",
    lac/lc = "Largeur du crâne/Longueur crâne",
    long_tot = "Longueur totale",
    long_sans_queue = "Longueur sans queue",
    long_queue = "Longueur de la queue",
    lq/lt = "Longueur queue/Longueur totale",
    larg_cuisse = "Largeur de la cuisse",
    lacu/lt = "Largeur de la cuisse/Longueur totale",
    masse = "Masse",
    sexe_male0_femelle1 = "Sexe")
  units = list(
    body_cond,
    circ_base_queue,
    cbq/lt,
    taille,
    long_oeil_oreille,
    loo/lc,
    loo/lt,
    long_crane,
    lc/lt,
    larg_crane,
    lac/lt,
    lac/lc,
    long_tot,
    long_sans_queue,
    long_queue,
    lq/lt,
    larg_cuisse,
    lacu/lt,
    masse,
    sexe_male0_femelle1)))


# Etape 5 : Sauvegarde locale des données retravaillées -------------------
write$rds(lezards, "data/lezards.rds")

