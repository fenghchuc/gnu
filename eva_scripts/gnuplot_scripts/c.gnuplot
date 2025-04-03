reset

set terminal eps size 5, 3 font 'Linux Libertine O,25'
set output sprintf("%s/graphs/c.eps", directory_path)

set xrange [0:8]
set yrange [0:800]

set xtics nomirror
set ytics nomirror
set xtics offset 0,0.6,0 font 'Linux Libertine O,20' ("4" 0, "16" 1, "64" 2, "256" 3, "1k" 4, "4k" 5, "16k" 6, "64k" 7, "128k" 8)
set ytics offset 0.2,0,0 font 'Linux Libertine O,20' (0, 200, 400, 600, 800)

set xlabel offset 0,1.2,0 font 'Linux Libertine O,25' "Group Length" 
set ylabel offset 1.6,0,0  font 'Linux Libertine O,25' "Query Latency(ms)"

set key font "Linux Libertine O,15" reverse top center Left width 2.5
set key maxrows 2

set lmargin 6.2
set rmargin 1.6
set tmargin 1
set bmargin 2

plot sprintf("%s/distilled_data/a_32.distilled", directory_path) title "A32" lc rgb "brown" lw 6 ps 1.2 pt 4 with linespoints,\
    sprintf("%s/distilled_data/a_256.distilled", directory_path) title "A256" lc rgb "sea-green" lw 6 ps 1.2 pt 6 with linespoints,\
    sprintf("%s/distilled_data/a_512.distilled", directory_path) title "A512" lc rgb "orchid4" lw 6 ps 1.2 pt 8 with linespoints,\
    sprintf("%s/distilled_data/a_2k.distilled", directory_path) title "A2k" lc rgb "grey30" lw 6 ps 1.2 pt 10 with linespoints