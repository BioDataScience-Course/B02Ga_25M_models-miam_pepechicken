# Importation et remaniement des données
SciViews::R("model")

# Etape 1 : Importation des données brutes --------------------------------
lezards <- read("data/lezards.csv") |> janitor::clean_names()
lezards <- srename(lezards,
  body_condition = "bodycond",
  base_tail_circumference_btc = "circbasequeue",
  btc_stl = "cbq_lt",
  body_size = "taillerelative",
  eye_to_ear_length_eel = "longoeiloreille",
  eel_skull_length = "loo_lc",
  eel_stl = "loo_lt",
  skull_length_sl = "longcrane",
  sl_stl = "lc_lt",
  skull_width_sw = "largcrane",
  sw_stl = "lac_lt",
  sw_sl = "lac_lc",
  snout_tail_length_stl = "longtot",
  snout_vent_length_svl = "longsansqueue",
  tail_length_tl = "longqueue",
  tl_stl = "lq_lt",
  thigh_width_tw = "largcuisse",
  tw_stl = "lacu_lt",
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
    bodycond = "Masse/Longueur totale",
    circbasequeue = "Circonférence de la base de la queue",
    cbq_lt = "Circonférence de la base de la queue/Longueur totale",
    taillerelative = "Taille relative",
    longoeiloreille = "Longueur de l'oeil à l'oreille",
    loo_lc = "Longueur de l'oeil à l'oreille/Longueur du crâne",
    loo_lt = "Longueur de l'oeil à l'oreille/Longueur totale",
    longcrane = "Longueur du crâne",
    lc_lt = "Longueur du crâne/Longueur totale",
    largcrane = "Largeur du crâne",
    lac_lt = "Largeur du crâne/Longueur totale",
    lac_lc = "Largeur du crâne/Longueur crâne",
    longtot = "Longueur totale",
    longsansqueue = "Longueur sans queue",
    longqueue = "Longueur de la queue",
    lq_lt = "Longueur queue/Longueur totale",
    largcuisse = "Largeur de la cuisse",
    lacu_lt = "Largeur de la cuisse/Longueur totale",
    masse = "Masse",
    sexe = "Sexe")
  units = list(
    bodycond = "kg/cm",
    circbasequeue = "cm",
    longoeiloreille = "cm",
    longcrane = "cm",
    largcrane = "cm",
    longtot = "cm",
    longsansqueue = "cm",
    longqueue = "cm",
    largcuisse = "cm",
    masse = "kg")))


# Etape 5 : Sauvegarde locale des données retravaillées -------------------
write$rds(lezards, "data/lezards.rds")

