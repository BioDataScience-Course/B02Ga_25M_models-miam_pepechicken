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
  skull_widt_sw = "larg_crane",
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



# Etape 5 : Sauvegarde locale des données retravaillées -------------------

