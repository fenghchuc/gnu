reset

set terminal eps size 4, 2.8 font 'Linux Libertine O,25'
set output sprintf("%s/graphs/c.eps", directory_path)

set xrange [0:7]
set yrange [10:160]

set xtics nomirror
set ytics nomirror
set xtics offset 0,0.6,0 font 'Linux Libertine O,20' ("4" 0, "16" 1, "64" 2, "256" 3, "1k" 4, "4k" 5, "16k" 6, "64k" 7)
set ytics offset 0.2,0,0 font 'Linux Libertine O,20' (10, 40, 70, 100, 130,160)

set xlabel offset 0,1.2,0 font 'Linux Libertine O,25' "Group Length" 
set ylabel offset 2.5,0,0  font 'Linux Libertine O,25' "Query Latency(ms)"

set key font "Linux Libertine O,13" reverse top center Left width 0.8
set key maxrows 2

set lmargin 5.5
set rmargin 1.6
set tmargin 0.8
set bmargin 2

plot sprintf("%s/distilled_data/a_32.distilled", directory_path) title "A32" lc rgb "#8a0404" lw 6 ps 1.2 pt 4 with linespoints,\
    sprintf("%s/distilled_data/a_256.distilled", directory_path) title "A256" lc rgb "#247a24" lw 6 ps 1.2 pt 6 with linespoints,\
    sprintf("%s/distilled_data/a_512.distilled", directory_path) title "A512" lc rgb "#5d198e" lw 6 ps 1.2 pt 8 with linespoints,\
    sprintf("%s/distilled_data/a_2k.distilled", directory_path) title "A2k" lc rgb "#454545" lw 6 ps 1.2 pt 10 with linespoints,\
    sprintf("%s/distilled_data/a_8k.distilled", directory_path) title "A8k" lc rgb "#715339" lw 6 ps 1.2 pt 12 with linespoints,\
    sprintf("%s/distilled_data/a_16k.distilled", directory_path) title "A16k" lc rgb "#ff941a" lw 6 ps 1.2 pt 14 with linespoints,\
    sprintf("%s/distilled_data/a_64k.distilled", directory_path) title "A64k" lc rgb "#018080" lw 6 ps 1.2 pt 3 with linespoints,\
    sprintf("%s/distilled_data/a_128k.distilled", directory_path) title "A128k" lc rgb "#8d491b" lw 6 ps 1.2 pt 2 with linespoints