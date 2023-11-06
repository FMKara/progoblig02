use context essentials2021
include color
#Norge
#Proporsjoner og størrelser for det norske flagget
Norge = 
  overlay-xy(rectangle(50, 400, "solid", color(0, 32, 91, 1)), -175, 0,
    overlay-xy(rectangle(550, 50, "solid", color(0, 32, 91, 1)), 0, -175,
      overlay-xy(rectangle(100, 400, "solid", "white"), -150, 0,
        overlay-xy(rectangle(550, 100, "solid", "white"), 0, -150,
          (rectangle(550, 400, "solid", color(186, 12, 47, 1)))))))

#Danmark
#Proporsjoner og størrelser for det danske flagget
Danmark =
  overlay-xy(rectangle(50, 350, "solid", "white"), -150, 0,
    overlay-xy(rectangle(450, 50, "solid", "white"), 0, -150,
      (rectangle(450, 350, "solid", color(200, 16, 46, 1)))))

#Sverige
#Proporsjoner og størrelser for det svenske flagget
Sverige =
  overlay-xy(rectangle(50, 250, "solid", color(255, 194, 0, 1)), -125, 0,
    overlay-xy(rectangle(400, 50, "solid", color(255, 194, 0, 1)), 0, -100,
      (rectangle(400, 250, "solid", color(0, 85, 131, 1)))))
#Finland
#Proporsjoner og størrelser for det finnske flagget
Finland =
  overlay-xy(rectangle(50, 250, "solid", "midnightblue"), -125, 0,
    overlay-xy(rectangle(400, 50, "solid", "midnightblue"), 0, -100,
      (rectangle(400, 250, "solid", "white"))))

#Island
#Proporsjoner og størrelser for det islandske flagget
Island =
  overlay-xy(rectangle(20, 180, "solid", color(220, 30, 53, 1)), -80, 0,
    overlay-xy(rectangle(250, 20, "solid", color(	220, 30, 53, 1)), 0, -80,
      overlay-xy(rectangle(40, 180, "solid", "white"), -70, 0,
        overlay-xy(rectangle(250, 40, "solid", "white"), 0, -70,
          (rectangle(250, 180, "solid",  color(2, 82, 156, 1)))))))


#Faeroyene
#Proporsjoner og størrelser for det færøyske flagget
Faeroyene =
  overlay-xy(rectangle(50, 400, "solid", color(237, 41, 57, 1)), -175, 0,
    overlay-xy(rectangle(550, 50, "solid", color(237, 41, 57, 1)), 0, -175,
      overlay-xy(rectangle(100, 400, "solid", color(0, 101, 189,1)), -150, 0,
        overlay-xy(rectangle(550, 100, "solid", color(0, 101, 189,1)), 0, -150,
          (rectangle(550, 400, "solid",  "white"))))))

#Funksjon for å se flagget
fun flagg(land):
  
  if land == "Norge":
    Norge
  else if land == "Danmark":
    Danmark
  else if land == "Sverige":
    Sverige
  else if land == "Finland":
    Finland
  else if land == "Island":
    Island
  else if land == "Faeroyene":
    Faeroyene
  end
end

flagg("Norge")
flagg("Danmark")
flagg("Sverige")
flagg("Finland")
flagg("Island")
flagg("Faeroyene")
