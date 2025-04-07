

reset
set terminal eps size 5, 3 font 'Linux Libertine O,25' 
set output sprintf("%s/graphs/heatmap.eps", directory_path)

set xrange [-0.5:14.5]
set yrange [7.5:-0.5]
set cbrange [0:75]

set xtics offset 0,0.6,0 font 'Linux Libertine O,16' ("4" 0, "8" 1, "16" 2, "32" 3, "64" 4, "128" 5, "256" 6, "512" 7, "1k" 8, "2k" 9, "4k" 10, "8k" 11, "16k" 12, "32k" 13, "64k" 14)
set ytics offset 0.5,0,0 font 'Linux Libertine O,20' ("A32" 0, "A256" 1, "A512" 2, "A2k" 3, "A8k" 4, "A16k" 5, "A64k" 6, "A128k" 7)
set cbtics offset -0.5,0.1,0 font 'Linux Libertine O,20' ("0" 0, "15" 15, "30" 30, "45" 45, "60" 60, "75" 75)

set tics nomirror out scale 0.5

set xlabel offset 0,1.2,0 font 'Linux Libertine O,25' "Group Length"
set ylabel offset 1.6,0,0 font 'Linux Libertine O,25' "Ratio of Cardinality"

do for [i=0:14] {
    set arrow from i-0.5,-0.5 to i-0.5,7.5 nohead lc rgb 'black' lw 2 front
}
do for [j=0:7] {
    set arrow from -0.5,j-0.5 to 14.5,j-0.5 nohead lc rgb 'black' lw 2 front
}

unset key

set lmargin 8
set rmargin 0
set tmargin 0.6
set bmargin 2.1

set palette defined(0 "#e3ecf2", 1 "#f8f8f8", 15 "#fdd3bd", 30 "#e98b6e", 45 "#c4393b", 60 "#a21227", 75 "#820822")

plot sprintf("%s/distilled_data/test.distilled", directory_path) matrix with image ,\
     '' matrix using 1:2:(sprintf("%s", $3 == 0 ? "✕" : sprintf("%.1f%%", $3))) with labels font 'Linux Libertine O,10.5' textcolor rgb 'black'

