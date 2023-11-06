use context essentials2021
#Dette inneholder data fra Google Drive-mappen
include shared-gdrive(
  "dcic-2021", 
  "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")

# Dette gir tilgang til Google Sheets.
include gdrive-sheets  
include data-source

#en variabel som inneholder en Google Sheets-ID
ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"

#en variabel som laster inn data fra et Google Sheets-regneark ved å bruke "load-table" funksjonen
kWh-wealthy-consumer-data =
load-table: komponent, energi
source: load-spreadsheet(ssid).sheet-by-name("kWh", true)
    sanitize energi using string-sanitizer 

end


Energy-per-unit-of-fuel = 10     
Distance-travelled-per-day = 48  
Distance-per-unit-of-fuel = 12    

#en funksjon som beregner energiforbruket for en bil per dag
fun car-energy-day(): 
 block:
    energy-used-day = ((Distance-travelled-per-day / Distance-per-unit-of-fuel) * Energy-per-unit-of-fuel)
    energy-used-day
 end
end

#for å gjøre om til et tall
fun energi-to-number(str :: String) -> Number: 
  block:
  cases(Option) string-to-number(str):
    | some(a) => a
      | none => car-energy-day()  
  end
       end
  
where:
  energi-to-number("") is car-energy-day()
energi-to-number("48") is 48
end

to-number = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)
#henter de tallverdiene som er gjordt om til konsollen.
print(to-number)

#beregner summen av tallverdiene i kolonnen "energi" 
til-sammen = sum(to-number, "energi") 

#oppretter en ny tabell med en enkelt rad som inneholder summen av energiverdiene.
til-sammen-tabel = table:komponent :: String, energi :: Number
  row:"til-sammen", til-sammen
end

line2 = get-row(til-sammen-tabel, 0)
add-row(to-number, line2)

#Henter ut gjennomsnittet til konsollen.
fun average-energy(): 
  
  block:
    average = til-sammen + car-energy-day()
    print("Average of used in kWh")
    average
  end
end

average-energy()

#Stolpe diagram med dataene
bar-chart(to-number, "komponent", "energi") 