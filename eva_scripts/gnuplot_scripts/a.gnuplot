

reset
set terminal eps size 5, 3 font 'Linux Libertine O,25' 
set output sprintf("%s/graphs/a.eps", directory_path)

set style data histograms
set style histogram clustered
set boxwidth 1 absolute

set label 77 "{/:Bold (b)}" font 'Linux Libertine O,25' at 1.8, 22.5

set yrange [0:25]
set y2range [0:8]

set xtics offset -0.5,0.5,0 font 'Linux Libertine O,25' ("bree" 1, 10, 100, 1000, 10000)
set ytics offset 0.6,0,0 font 'Linux Libertine O,25'
set y2tics offset -0.6,0,0 font 'Linux Libertine O,25' 
set ytics nomirror

set xlabel offset 0,1.2,0 font 'Linux Libertine O,25' "Segments per bitvector" 
set ylabel offset 2,0,0  font 'Linux Libertine O,25' "Query Latency (ms)"
set y2label offset -1.8,0,0  font 'Linux Libertine O,25' "UDI Latency (ms)"

set key font "Linux Libertine O,25" top right

set lmargin 5.1
set rmargin 5.3
set tmargin 1
set bmargin 2

plot sprintf("%s/distilled_data/test.distilled", directory_path) using 2:xtic(1) t "Query" lc rgb "black" fill solid 1.0 border rgb "black",\
     sprintf("%s/distilled_data/test.distilled", directory_path) using 3 t "UDI" lc rgb "black" fill pattern 7 border rgb "black" axes x1y2