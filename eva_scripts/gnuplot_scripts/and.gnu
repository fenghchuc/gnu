reset

set terminal eps font 'Linux Libertine O,25'
set size ratio 0.58 

set output "and.eps"

set xrange [2:128]
set yrange [0:40]

set logscale x 2  # 使用对数刻度，基数为2
set format x "2^{%L}"  # 设置x轴标签格式为2的幂次
set xtics ("2" 2,"4" 4, "8" 8, "16" 16, "32" 32, "64" 64, "128" 128) font ',28' offset 0,0.4,0
set ytics 10 font ',30'

set xlabel "Number of bitvectors ANDed" offset 0,1.0 font ',25' textcolor rgb "blue"
set ylabel "Query Latency (ms)" offset 1.1,-0.2 font ',25'  textcolor rgb "blue"

set key font 'Linux Libertine O,25' reverse vertical Left at graph 0.85, 0.38

#set label 77 "{/:Bold (b)}" at 3,2100 font 'Linux Libertine O,28'

set border lc rgb "blue"

set lmargin 3.0
set rmargin 0.0
set tmargin 0.5
set bmargin 2.0

      
 	
plot	"and.dat" index 1 title "A64" lc rgb '#8B0000' lw 8 ps 1.5 pt 12 dt 4 with linespoints,\
	"and.dat" index 2 title "A128" lc rgb '#4B0082' lw 8 ps 1.5 pt 5 dt 5 with linespoints,\
	"and.dat" index 3 title "A256" lc rgb '#006400' lw 8 ps 1.5 pt 6  with linespoints, \
