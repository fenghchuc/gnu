

reset
set terminal eps size 10, 3.5 font 'Linux Libertine O,25' 
set output "heatmap.eps"

set xrange [-0.5:14.5]
set yrange [7.5:-0.5]
set cbrange [0:75]

set xtics offset 0,0.6,0 font 'Linux Libertine O,28' ("4" 0, "" 1, "16" 2, "" 3, "64" 4, "" 5, "256" 6, "" 7, "1k" 8, "" 9, "4k" 10, "" 11, "16k" 12, "" 13, "64k" 14)
set ytics offset 0.5,0,0 font 'Linux Libertine O,28' ("A32" 0, "A256" 1, "A512" 2, "A2k" 3, "A8k" 4, "A16k" 5, "A64k" 6, "A128k" 7)
set cbtics offset -0.3,0,0 font 'Linux Libertine O,28' ("0" 0, "15%%" 15, "30%%" 30, "45%%" 45, "60%%" 60, "75%%" 75)

set tics nomirror out scale 0.5

set xlabel offset 0,1.2,0 font 'Linux Libertine O,28' "GE Group Size"
set ylabel offset 0.4,0,0 font 'Linux Libertine O,28' "Cardinality"
set cblabel offset 1.2,0,0 font 'Linux Libertine O,28' "Space Overhead"

do for [i=0:14] {
    set arrow from i-0.5,-0.5 to i-0.5,7.5 nohead lc rgb 'black' lw 2 front
}
do for [j=0:7] {
    set arrow from -0.5,j-0.5 to 14.5,j-0.5 nohead lc rgb 'black' lw 2 front
}

unset key

set lmargin 8.9
set rmargin 1.8
set tmargin 0.4
set bmargin 2.2

set palette defined(0 "#e3ecf2", 1 "#f8f8f8", 15 "#f0d9da", 30 "#e7bbbc", 45 "#df9c9d", 60 "#d67e7f", 75 "#ce5f61")

plot "data.distilled" matrix with image ,\
     '' matrix using 1:2:(sprintf("%s", $3 == 0 ? "✕" : sprintf("%.0f%%", $3))) with labels font 'Linux Libertine O,30' textcolor rgb 'black'

