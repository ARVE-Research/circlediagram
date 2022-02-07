#!/bin/bash

module load GMT

#-------------------------------------------------------------------------------------
#setup

gmt gmtset GMT_VERBOSE normal
gmt gmtset MAP_FRAME_TYPE plain
gmt gmtset MAP_FRAME_PEN 0.5p,0
gmt gmtset PS_MEDIA a0
gmt gmtset FONT_ANNOT_PRIMARY 9p,Helvetica,black
gmt gmtset FONT_LABEL 9p,Helvetica,black

datadir=data

wid=9.3             #plot width in cm
pen=thinnest,black  #line pen attributes

cpt=Ifugao.cpt

radius=3000     #plot width in meters

let xmin=-$radius
xmax=$radius
let ymin=-$radius
ymax=$radius

let pw_meters=$xmax-$xmin  #plot with in meters

output=03_FigS1.ps

# ------------------------------
# 1. 1800 Template

infile=$datadir/Template_1800.csv

pop=`head -n1 $infile | awk 'BEGIN{FS=","}{print $1}'`

gmt psbasemap -R$xmin/$xmax/$ymin/$ymax -JX$wid -X0 -Y40 -B0 -P -K > $output

awk -f parsedata.awk $infile | sort -n | ./parsedata $wid $pw_meters | gmt psxy -R -J -W$pen -C$cpt -S -O -P -K >> $output

echo "a"    | gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output
echo "Standard" | gmt pstext -R -J -F+cTC+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output

echo $pop  | gmt pstext -R -J -F+cTR+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output

# ------------------------------
# 2. Low Population

infile=$datadir/Scenario_Low_Population.csv

pop=`head -n1 $infile | awk 'BEGIN{FS=","}{print $1}'`

gmt psbasemap -R -J -X9.6 -Y0 -B0 -O -P -K >> $output

awk -f parsedata.awk $infile | sort -n | ./parsedata $wid $pw_meters | gmt psxy -R -J -W$pen -C$cpt -S -O -P -K >> $output

echo "b"    | gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output
echo "Low population" | gmt pstext -R -J -F+cTC+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output
echo $pop   | gmt pstext -R -J -F+cTR+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output

# ------------------------------
# 3. High Daily Caloric Intake

infile=$datadir/Scenario_High_Daily_Caloric_Intake.csv

pop=`head -n1 $infile | awk 'BEGIN{FS=","}{print $1}'`

gmt psbasemap -R -J -X-9.6 -Y-9.6 -B0 -O -P -K >> $output

awk -f parsedata.awk $infile | sort -n | ./parsedata $wid $pw_meters | gmt psxy -R -J -W$pen -C$cpt -S -O -P -K >> $output

echo "c"    | gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output
echo "High caloric intake" | gmt pstext -R -J -F+cTC+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output
echo $pop   | gmt pstext -R -J -F+cTR+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output

# ------------------------------
# 4. High Yield Rice

infile=$datadir/Scenario_High_Yield_Rice.csv

pop=`head -n1 $infile | awk 'BEGIN{FS=","}{print $1}'`

gmt psbasemap -R -J -X9.6 -Y0 -B0 -O -P -K >> $output

awk -f parsedata.awk $infile | sort -n | ./parsedata $wid $pw_meters | gmt psxy -R -J -W$pen -C$cpt -S -O -P -K >> $output

echo "d"    | gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output
echo "High yield rice" | gmt pstext -R -J -F+cTC+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output
echo $pop   | gmt pstext -R -J -F+cTR+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output

# ------------------------------
# 5. Yams Only Grown in OKV

infile=$datadir/Scenario_Only_Yams_Grown_in_OKV.csv

pop=`head -n1 $infile | awk 'BEGIN{FS=","}{print $1}'`

gmt psbasemap -R -J -X-9.6 -Y-9.6 -B0 -O -P -K >> $output

awk -f parsedata.awk $infile | sort -n | ./parsedata $wid $pw_meters | gmt psxy -R -J -W$pen -C$cpt -S -O -P -K >> $output

echo "e"    | gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output
echo "Yams only" | gmt pstext -R -J -F+cTC+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output
echo $pop   | gmt pstext -R -J -F+cTR+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output

# ------------------------------
# 6. Sweet Potatoes Only Grown in OKV

infile=$datadir/Scenario_Only_Sweet_Potatoes_Grown_in_OKV.csv

pop=`head -n1 $infile | awk 'BEGIN{FS=","}{print $1}'`

gmt psbasemap -R -J -X9.6 -Y0 -B0 -O -P -K >> $output

awk -f parsedata.awk $infile | sort -n | ./parsedata $wid $pw_meters | gmt psxy -R -J -W$pen -C$cpt -S -O -P -K >> $output

echo "f"    | gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output
echo "Sweet potatoes only" | gmt pstext -R -J -F+cTC+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output
echo $pop   | gmt pstext -R -J -F+cTR+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output

# ------------------------------
# 7. Poor Rice Harvest

infile=$datadir/Scenario_Poor_Rice_Harvesst.csv

pop=`head -n1 $infile | awk 'BEGIN{FS=","}{print $1}'`

gmt psbasemap -R -J -X-9.6 -Y-9.6 -B0 -O -P -K >> $output

awk -f parsedata.awk $infile | sort -n | ./parsedata $wid $pw_meters | gmt psxy -R -J -W$pen -C$cpt -S -O -P -K >> $output

echo "g"    | gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output
echo "Poor rice harvest" | gmt pstext -R -J -F+cTC+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output
echo $pop   | gmt pstext -R -J -F+cTR+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output


# ------------------------------
# map scale bar

mapscale=`echo "2*$radius*100 / $wid" | bc -l`
scalebar=`echo $radius / 1000 | bc -l`

# echo $mapscale $scalebar

gmt psbasemap -R$xmin/$xmax/$ymin/$ymax"+ue" -Jq0/0/1:$mapscale -LjTC0+w$scalebar+f+l"km"+o0/0.8 -X9.6 -Y0 -O -P -K >> $output

# ------------------------------
# legend

radius=4500     #plot width in meters

let xmin=-$radius
xmax=$radius
let ymin=-$radius
ymax=$radius

#----
#automatic legend - vertical

xmink=`echo "$xmin/1000" | bc -l`
xmaxk=`echo "$xmax/1000" | bc -l`
ymink=`echo "$ymin/1000" | bc -l`
ymaxk=`echo "$ymax/1000" | bc -l`
radkm=`echo "$radius/1000" | bc -l`

gmt psbasemap -R0/$wid/-4.65/4.65 -JX9.3 -X0 -Y0 -B0 -O -P -K >> $output

echo "h" | gmt pstext -R -J -F+cTL+f9p,Helvetica-Bold -Dj0.3 -O -P -K >> $output

#----
#plot legend

cpt=Ifugao_legend.cpt

# gmt pslegend

fontstring="-F+jML+f9p,Helvetica"

echo 4 1.75 0.6 0.4 | gmt psxy -R -J -Sr -Gred3 -Wthinnest,black -O -P -K >> $output
echo 4 1.75 "Settlement" | gmt pstext -R -J $fontstring -D0.4/0 -O -P -K >> $output

echo 4 1.15 0.6 0.4 | gmt psxy -R -J -Sr -Gdeeppink -Wthinnest,black -O -P -K >> $output
echo 4 1.15 "Rice terraces (Payo)" | gmt pstext -R -J $fontstring -D0.4/0 -O -P -K >> $output

echo 4 0.55 0.6 0.4 | gmt psxy -R -J -Sr -G251/106/74 -Wthinnest,black -O -P -K >> $output
echo 4 0.55 "Active swidden fields (Uma)" | gmt pstext -R -J $fontstring -D0.4/0 -O -P -K >> $output

echo 4 -0.05 0.6 0.4 | gmt psxy -R -J -Sr -G254/224/210 -Wthinnest,black -O -P -K >> $output
echo 4 -0.05 "Fallow swidden fields (Uma)" | gmt pstext -R -J $fontstring -D0.4/0 -O -P -K >> $output

echo 4 -0.65 0.6 0.4 | gmt psxy -R -J -Sr -Ggold2 -Wthinnest,black -O -P -K >> $output
echo 4 -0.65 "Pasture (Carabao)" | gmt pstext -R -J $fontstring -D0.4/0 -O -P -K >> $output

echo 4 -1.25 0.6 0.4 | gmt psxy -R -J -Sr -Glimegreen -Wthinnest,black -O -P -K >> $output
echo 4 -1.25 "Agroforestry (Muyong)" | gmt pstext -R -J $fontstring -D0.4/0 -O -P -K >> $output

echo 4 -1.85 0.6 0.4 | gmt psxy -R -J -Sr -Gdarkbrown -Wthinnest,black -O -P -K >> $output
echo 4 -1.85 "Woodlot for fuel (Muyong)" | gmt pstext -R -J $fontstring -D0.4/0 -O -P -K >> $output

echo 4 -2.45 0.6 0.4 | gmt psxy -R -J -Sr -Gkhaki3 -Wthinnest,black -O -P -K >> $output
echo 4 -2.45 "Forest browse (Pigs)" | gmt pstext -R -J $fontstring -D0.4/0 -O -P -K >> $output

echo 4 -3.05 0.6 0.4 | gmt psxy -R -J -Sr -G173/221/142 -Wthinnest,black -O -P -K >> $output
echo 4 -3.05 "Hunting and gathering" | gmt pstext -R -J $fontstring -D0.4/0 -O -P -K >> $output

# intensity level brackets

fontstring="-F+jMR+f9p,Helvetica"
fontstringb="-F+jML+f9p,Helvetica-Bold"

echo 3.55 2.4 "@#intensity@#" | gmt pstext -R -J -F+jMR+f9p,Helvetica-Bold -D-0.2/0 -O -P -K >> $output
echo 3.55 2.4 "@#category@#"  | gmt pstext -R -J -F+jML+f9p,Helvetica-Bold -D0.2/0 -O -P -K >> $output


# level 1 - 1 element

gmt psxy -R -J -W0.5p,black -O -P -K << END >> $output
3.65 2.0
3.55 2.0
3.55 1.5
3.65 1.5
END

echo 3.55 1.75 very high | gmt pstext -R -J $fontstring -D-0.1/0 -O -P -K >> $output

# level 2 - 1 element

gmt psxy -R -J -W0.5p,black -O -P -K << END >> $output
3.65 1.4
3.55 1.4
3.55 0.9
3.65 0.9
END

echo 3.55 1.15 high | gmt pstext -R -J $fontstring -D-0.1/0 -O -P -K >> $output

# level 3 - 1 element

gmt psxy -R -J -W0.5p,black -O -P -K << END >> $output
3.65 0.8
3.55 0.8
3.55 0.3
3.65 0.3
END

echo 3.55 0.55 moderate-high | gmt pstext -R -J $fontstring -D-0.1/0 -O -P -K >> $output

# level 4 - 2 elements

gmt psxy -R -J -W0.5p,black -O -P -K << END >> $output
3.65  0.2
3.55  0.2
3.55 -0.9
3.65 -0.9
END

echo 3.55 -0.35 moderate | gmt pstext -R -J $fontstring -D-0.1/0 -O -P -K >> $output

# level 5 - 3 elements

gmt psxy -R -J -W0.5p,black -O -P -K << END >> $output
3.65 -1.0
3.55 -1.0
3.55 -2.7
3.65 -2.7 
END

echo 3.55 -1.85 low | gmt pstext -R -J $fontstring -D-0.1/0 -O -P -K >> $output

# level 6 - 1 element

gmt psxy -R -J -W0.5p,black -O -P -K << END >> $output
3.65 -2.8
3.55 -2.8
3.55 -3.3
3.65 -3.3
END

echo 3.55 -3.05 very low | gmt pstext -R -J $fontstring -D-0.1/0 -O -P -K >> $output

# ------------------------------

gmt psbasemap -R -J -B0 -O -P >> $output

# ------------------------------

gmt psconvert -A -Tf -Z $output

