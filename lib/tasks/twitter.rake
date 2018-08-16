desc "Follow et DM follower d'OPenclassroom"
task :Scrap_les_deputes do
  puts "Debut du programme twitter"
    ScrapParlement.perform
  puts "Le programme a bien tourné"
end