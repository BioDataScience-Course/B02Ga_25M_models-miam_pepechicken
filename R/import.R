# Importation et remaniement des données
SciViews::R("model")

# Etape 1 : Importation des données brutes --------------------------------
lezards <- read("data/lezards.csv") |> janitor::clean_names()
lezards <- srename(lezards,
  body_condition = "body_cond",
  base_tail_circumference_btc = "circ_base_queue",
  btc_stl = "cbq/lt",
  body_size = "taille_relative",
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
  sex_male_0_female_1 = "sexe")
  

# Etape 2 : Description brève des données ---------------------------------

#body_cond : masse divisée par la longueur totale (kg/cm)
#circ_base_queue : circonférence de la base de la queue (cm)
#cbq/lt : circonférence de la base de la queue / longueur totale 
#taille_relative : taille relative
#long_oeil_oreille : longueur à partir de la partie antérieure de l'oeil jusqu'à la partie postérieure de l'oreille (cm)
#loo/lc : longueur à partir de la partie antérieure de l'oeil jusqu'à la partie postérieure de l'oreille / longueur du crâne 
#loo/lt : longueur à partir de la partie antérieure de l'oeil jusqu'à la partie postérieure de l'oreille / longueur totale 
#long_crane : longueur du museau jusqu'à la base du crâne (cm)
#lc/lt : longueur du museau jusqu'à la base du crâne / longueur totale 
#larg_crane : longueur de la partie la plus large du crâne (cm) 
#lac/lt : longueur de la partie la plus large du crâne / longueur totale 
#lac/lc : longueur de la partie la plus large du crâne / longueur du crâne
#long_tot : longueur du museau jusqu'au bout de la queue (cm)
#long_sans_queue : longueur du museau jusqu'au cloaque (cm)
#long_queue : longueur de la queue du cloaque jusqu'au bout (cm)
#lq/lt : longueur de la queue du cloaque jusqu'au bout / longueur du museau jusqu'au cloaque 
#larg_cuisse : circonférence du milieu de la cuisse (cm)
#lacu/lt : circonférence du milieu de la cuisse / longueur du museau jusqu'au bout de la queue 
#masse : masse de l'animal (kg)
#sexe : male = 0 et femelle = 1

skimr::skim(lezards)


# Etape 3 : Nettoyage des données  ----------------------------------------



# Etape 4 : Ajout des labels et des unités --------------------------------

lezards <- labelise(lezards,
  label=list(
    body_cond = "Masse/Longueur totale",
    circ_base_queue = "Circonférence de la base de la queue",
    cbq/lt = "Circonférence de la base de la queue/Longueur totale",
    taille relative = "Taille relative",
    long_oeil_oreille = "Longueur de l'oeil à l'oreille",
    loo/lc = "Longueur de l'oeil à l'oreille/Longueur du crâne",
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
    body_cond = "kg/cm",
    circ_base_queue = "cm",
    long_oeil_oreille = "cm",
    long_crane = "cm",
    larg_crane = "cm",
    long_tot = "cm",
    long_sans_queue = "cm",
    long_queue = "cm",
    larg_cuisse = "cm",
    masse = "kg")))


# Etape 5 : Sauvegarde locale des données retravaillées -------------------
write$rds(lezards, "data/lezards.rds")

