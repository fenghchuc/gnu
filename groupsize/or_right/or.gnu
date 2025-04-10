reset

set terminal eps font 'Linux Libertine O,25'
set size ratio 0.58  # 0.625 = 2.5 / 3.8

set output  "or.eps"

set xrange [0:7]
set yrange [0:280]


set xtics ("4" 0, "16" 1, "64" 2, "256" 3, "1k" 4, "4k" 5, "16k" 6, "64k" 7) font 'Linux Libertine O,28' offset 0,0.4,0
set mxtics 4
set tics scale 1,0.5 nomirror
set ytics ("0" 0, "40" 40, "80" 80, "120" 120, "160" 160, "200" 200, "240" 240, "280" 280) font 'Linux Libertine O,28'

set xlabel "GE Group Length" offset 0,1.1 font 'Linux Libertine O,25' 
set ylabel "Range Query Latency (ms)" offset 0,-0.2 font 'Linux Libertine O,25' 

set key font 'Linux Libertine O,18' reverse vertical Left at graph 0.95, 0.95 maxrows 2 maxcols 3

#set border lc rgb "blue"

set lmargin 5.5
set rmargin 1.0
set tmargin 0.5
set bmargin 2.0

      
#set label 1 "A32" at graph 0.45, 0.95 tc rgb "#8B0000"
#set label 2 "A256" at graph 0.45, 0.80 tc rgb "#006400"
#set label 3 "A512" at graph 0.45, 0.75 tc rgb "#4B0082"
#set label 4 "A2k" at graph 0.45, 0.70 tc rgb "#404040"
#set label 5 "A8k" at graph 0.45, 0.65 tc rgb "#654321"
#set label 6 "A16k" at graph 0.45, 0.60 tc rgb "#FF8C00"
#set label 7 "A64k" at graph 0.45, 0.55 tc rgb "#008080"
#set label 8 "A128k" at graph 0.65, 0.85 tc rgb "#8B4513"
#set label 9 "Scan" at graph 0.65, 0.80 tc rgb "dark-orange" 	
#set arrow 1 from 1.1,165 to 1.9,185 head filled size screen 0.03,15,45 lw 5 lc rgb "dark-orange"
#set label 10 "Scan" at graph 0.03, 0.6 tc rgb "dark-orange" font 'Linux Libertine O,25'

plot  "or.dat" index 0 title "A32" lc rgb '#8B0000' lw 8 ps 1.5 pt 4 with linespoints,\
	 "or.dat" index 1 title "A256" lc rgb '#006400' lw 8 ps 1.5 pt 6 with linespoints,\
	 "or.dat" index 2 title "A512" lc rgb '#4B0082' lw 8 ps 1.5 pt 8 with linespoints, \
	 "or.dat" index 3 title "A2k" lc rgb '#404040' lw 8 ps 1.5 pt 10 with linespoints, \
	 "or.dat" index 4 title "A8k" lc rgb '#654321' lw 8 ps 1.5 pt 12 with linespoints, \
	 "or.dat" index 5 title "A16k" lc rgb '#FF8C00' lw 8 ps 1.5 pt 14 with linespoints, \
	 "or.dat" index 6 title "A64k" lc rgb '#008080' lw 8 ps 1.5 pt 3 with linespoints,\
	 "or.dat" index 7 title "A128k" lc rgb '#8B4513' lw 8 ps 1.5 pt 2 with linespoints,\
	 190  with lines lc rgb "dark-orange" lw 8 lt 2 dashtype 2 notitle
	#'-' with lines lc rgb "dark-orange" lw 8 lt 2 dashtype 2 notitle
	#0.5 145
	#6.1 145
	#e
