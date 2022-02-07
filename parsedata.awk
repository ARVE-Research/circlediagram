BEGIN{
  FS=","
  lev[1] = 1  # Settlement
  lev[2] = 2  # Terracing (Payo)
  lev[3] = 3  # Active swidden fields (Uma)
  lev[4] = 4  # Fallow swidden fields (Uma)
  lev[5] = 4  # Pastureland (Carabao)
  lev[6] = 5  # Agroforestry (Muyong)
  lev[7] = 5  # Woodlot for (Muyong)
  lev[8] = 2  # Quarries
  lev[9] = 5  # Forest Browse (Pigs)
  lev[10]= 6  # Hunting and gathering 
  getline
  getline
}{
  # the Fortran program that does the projection into map space expects three columns: level,cat,area
  print $4,$1,$3
}
