# Cargar paquetes
library(plyr)
library(dplyr)
library(ggplot2)
library(vegan)
library(Hmisc)
require(reshape2)
require(lubridate)

# Configurar el directorio de trabajo
# Betty
setwd("X:/Dropbox/���THESIS!!!/Datos/Climate")
# Blackhawck
setwd("E:/Dropbox/���THESIS!!!/Datos/Climate")

# Leer datos
datos<-read.csv2("Nuqui_TRMM_CHIRPS.csv", header=T)
datos$date<-as.Date(datos$Fecha, format = "%d/%m/%Y")

# Calculate month from date & create factor:
datos$month <- with(datos, factor(as.POSIXlt(date)$mon, label=month.abb))

# Calculate year from date:
datos$year <- with(datos, 1900 + as.POSIXlt(date)$year)
datos$mes <- month(datos$Fecha)

# Serie mensual
datos.mes <-
  datos %>%
  group_by(year, mes) %>%
  summarise(Nuqu�.Sur.TRMM = sum(Nuqu�.sur.TRMM),
            Nuqu�.Sur.CHIRPS = sum(Nuqu�.sur.CHIRPS),
            Nuqu�.Centro.TRMM = sum(Nuqu�.centro.TRMM),
            Nuqu�.Centro.CHIRPS= sum(Nuqu�.centro.CHIRPS),
            Nuqu�.Norte.TRMM = sum(Nuqu�.norte.TRMM),
            Nuqu�.Norte.CHIRPS = sum(Nuqu�.norte.CHIRPS),
            Bah�a.Solano.Sur.TRMM = sum(Bah�a.Solano.sur.TRMM),
            Bah�a.Solano.Sur.CHIRPS = sum(Bah�a.Solano.sur.CHIRPS),
            Bah�a.Solano.Centro.TRMM = sum(Bah�a.Solano.centro.TRMM),
            Bah�a.Solano.Centro.CHIRPS = sum(Bah�a.Solano.centro.CHIRPS),
            Bah�a.Solano.Norte.TRMM = sum(Bah�a.Solano.norte.TRMM),
            Bah�a.Solano.Norte.CHIRPS = sum(Bah�a.Solano.norte.CHIRPS)
           )

# Serie mensual 1994-2005
datos.mes.9405 <-
  datos.mes %>%
  filter(year >= 1994, year <= 2005)

# Ciclo anual 
CicloAnual <-
  datos.mes %>%
  group_by(mes) %>%
  summarise(n = n(),
            Nuqu�.South.TRMM = mean(Nuqu�.Sur.TRMM, na.rm = TRUE),
            Nuqu�.South.CHIRPS = mean(Nuqu�.Sur.CHIRPS, na.rm = TRUE),
            Nuqu�.Center.TRMM = mean(Nuqu�.Centro.TRMM, na.rm = TRUE),
            Nuqu�.Center.CHIRPS= mean(Nuqu�.Centro.CHIRPS, na.rm = TRUE),
            Nuqu�.North.TRMM = mean(Nuqu�.Norte.TRMM, na.rm = TRUE),
            Nuqu�.North.CHIRPS = mean(Nuqu�.Norte.CHIRPS, na.rm = TRUE),
            Bah�a.Solano.South.TRMM = mean(Bah�a.Solano.Sur.TRMM, na.rm = TRUE),
            Bah�a.Solano.South.CHIRPS = mean(Bah�a.Solano.Sur.CHIRPS, na.rm = TRUE),
            Bah�a.Solano.Center.TRMM = mean(Bah�a.Solano.Centro.TRMM, na.rm = TRUE),
            Bah�a.Solano.Center.CHIRPS = mean(Bah�a.Solano.Centro.CHIRPS, na.rm = TRUE),
            Bah�a.Solano.North.TRMM = mean(Bah�a.Solano.Norte.TRMM, na.rm = TRUE),
            Bah�a.Solano.North.CHIRPS = mean(Bah�a.Solano.Norte.CHIRPS, na.rm = TRUE)
            )

# Ciclo anual 1994-2005
CicloAnual9405 <-
  datos.mes.9405 %>%
  group_by(mes) %>%
  summarise(n = n(),
            Nuqu�.South.TRMM = mean(Nuqu�.Sur.TRMM, na.rm = TRUE),
            Nuqu�.South.CHIRPS = mean(Nuqu�.Sur.CHIRPS, na.rm = TRUE),
            Nuqu�.Center.TRMM = mean(Nuqu�.Centro.TRMM, na.rm = TRUE),
            Nuqu�.Center.CHIRPS= mean(Nuqu�.Centro.CHIRPS, na.rm = TRUE),
            Nuqu�.North.TRMM = mean(Nuqu�.Norte.TRMM, na.rm = TRUE),
            Nuqu�.North.CHIRPS = mean(Nuqu�.Norte.CHIRPS, na.rm = TRUE),
            Bah�a.Solano.South.TRMM = mean(Bah�a.Solano.Sur.TRMM, na.rm = TRUE),
            Bah�a.Solano.South.CHIRPS = mean(Bah�a.Solano.Sur.CHIRPS, na.rm = TRUE),
            Bah�a.Solano.Center.TRMM = mean(Bah�a.Solano.Centro.TRMM, na.rm = TRUE),
            Bah�a.Solano.Center.CHIRPS = mean(Bah�a.Solano.Centro.CHIRPS, na.rm = TRUE),
            Bah�a.Solano.North.TRMM = mean(Bah�a.Solano.Norte.TRMM, na.rm = TRUE),
            Bah�a.Solano.North.CHIRPS = mean(Bah�a.Solano.Norte.CHIRPS, na.rm = TRUE)
            )
###################   Nuqui  All Data  ###################
# Grafica ciclo anual precipitacion Nuqu� Sur TRMM
ggplot(CicloAnual,
       aes(x = mes,
           y = Nuqu�.South.TRMM,
           group = 1)) + 
  geom_line(color="deepskyblue1") +
  geom_point(color="deepskyblue1") +
  labs(title = "Annual Cycle of Precipitation at Nuqu� South TRMM",
     x = "Month",
     y = "Total Precipitation [mm]",
     subtitle = "January 1998 - December 2015") +
  theme_classic()

# Grafica ciclo anual precipitacion Nuqu� Sur CHIRPS
ggplot(CicloAnual,
       aes(x = mes,
           y = Nuqu�.South.CHIRPS,
           group = 1)) + 
  geom_line(color="dodgerblue1") +
  geom_point(color="dodgerblue1") +
  labs(title = "Annual Cycle of Precipitation at Nuqu� South CHIRPS",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1981 - December 2016") +
  theme_classic()

# Grafica ciclo anual precipitacion Nuqu� Centro TRMM
ggplot(CicloAnual,
       aes(x = mes,
           y = Nuqu�.Center.TRMM,
           group = 1)) + 
  geom_line(color="deepskyblue3") +
  geom_point(color="deepskyblue3") +
  labs(title = "Annual Cycle of Precipitation at Nuqu� Center TRMM",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1998 - December 2015") +
  theme_classic()

# Grafica ciclo anual precipitacion Nuqu� Centro CHIRPS
ggplot(CicloAnual,
       aes(x = mes,
           y = Nuqu�.Center.CHIRPS,
           group = 1)) + 
  geom_line(color="dodgerblue3") +
  geom_point(color="dodgerblue3") +
  labs(title = "Annual Cycle of Precipitation at Nuqu� Center CHIRPS",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1981 - December 2016") +
  theme_classic()

# Grafica ciclo anual precipitacion Nuqu� Norte TRMM
ggplot(CicloAnual,
       aes(x = mes,
           y = Nuqu�.North.TRMM,
           group = 1)) + 
  geom_line(color="deepskyblue4") +
  geom_point(color="deepskyblue4") +
  labs(title = "Annual Cycle of Precipitation at Nuqu� North TRMM",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1998 - December 2015") +
  theme_classic()

# Grafica ciclo anual precipitacion Nuqu� Norte CHIRPS
ggplot(CicloAnual,
       aes(x = mes,
           y = Nuqu�.North.CHIRPS,
           group = 1)) + 
  geom_line(color="dodgerblue4") +
  geom_point(color="dodgerblue4") +
  labs(title = "Annual Cycle of Precipitation at Nuqu� North CHIRPS",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1981 - December 2016") +
  theme_classic()

###################   Bahia All data    ###################
# Grafica ciclo anual precipitacion Bah�a Solano Sur TRMM 
ggplot(CicloAnual,
       aes(x = mes,
           y = Bah�a.Solano.South.TRMM,
           group = 1)) + 
  geom_line(color="skyblue1") +
  geom_point(color="skyblue1") +
  labs(title = "Annual Cycle of Precipitation at Bah�a Solano South TRMM",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1998 - December 2015") +
  theme_classic()

# Grafica ciclo anual precipitacion Bah�a Solano Sur CHIRPS
ggplot(CicloAnual,
       aes(x = mes,
           y = Bah�a.Solano.South.CHIRPS,
           group = 1)) + 
  geom_line(color="steelblue1") +
  geom_point(color="steelblue1") +
  labs(title = "Annual Cycle of Precipitation at Bah�a Solano South CHIRPS",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1981 - December 2016") +
  theme_classic()

# Grafica ciclo anual precipitacion Bah�a Solano Centro TRMM
ggplot(CicloAnual,
       aes(x = mes,
           y = Bah�a.Solano.Center.TRMM,
           group = 1)) + 
  geom_line(color="skyblue3") +
  geom_point(color="skyblue3") +
  labs(title = "Annual Cycle of Precipitation at Bah�a Solano Center TRMM",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1998 - December 2015") +
  theme_classic()

# Grafica ciclo anual precipitacion Bah�a Solano Centro CHIRPS
ggplot(CicloAnual,
       aes(x = mes,
           y = Bah�a.Solano.Center.CHIRPS,
           group = 1)) + 
  geom_line(color="steelblue3") +
  geom_point(color="steelblue3") +
  labs(title = "Annual Cycle of Precipitation at Bah�a Solano Center CHIRPS",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1981 - December 2016") +
  theme_classic()

# Grafica ciclo anual precipitacion Bah�a Solano Norte TRMM
ggplot(CicloAnual,
       aes(x = mes,
           y = Bah�a.Solano.North.TRMM,
           group = 1)) + 
  geom_line(color="skyblue4") +
  geom_point(color="skyblue4") +
  labs(title = "Annual Cycle of Precipitation at Bah�a Solano North TRMM",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1998 - December 2015") +
  theme_classic()

# Grafica ciclo anual precipitacion Bah�a Solano Norte CHIRPS
ggplot(CicloAnual,
       aes(x = mes,
           y = Bah�a.Solano.North.CHIRPS,
           group = 1)) + 
  geom_line(color="steelblue4") +
  geom_point(color="steelblue4") +
  labs(title = "Annual Cycle of Precipitation at Bah�a Solano North CHIRPS",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1981 - December 2016") +
  theme_classic()

###############   Nuqui  Simulation Period  #################
# Grafica ciclo anual precipitacion Nuqu� Sur TRMM
ggplot(CicloAnual9405,
       aes(x = mes,
           y = Nuqu�.South.TRMM,
           group = 1)) + 
  geom_line(color="deepskyblue1") +
  geom_point(color="deepskyblue1") +
  labs(title = "Annual Cycle of Precipitation at Nuqu� South TRMM",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1998 - December 2005") +
  theme_classic()

# Grafica ciclo anual precipitacion Nuqu� Sur CHIRPS
ggplot(CicloAnual9405,
       aes(x = mes,
           y = Nuqu�.South.CHIRPS,
           group = 1)) + 
  geom_line(color="dodgerblue1") +
  geom_point(color="dodgerblue1") +
  labs(title = "Annual Cycle of Precipitation at Nuqu� South CHIRPS",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1994 - December 2005") +
  theme_classic()

# Grafica ciclo anual precipitacion Nuqu� Centro TRMM
ggplot(CicloAnual9405,
       aes(x = mes,
           y = Nuqu�.Center.TRMM,
           group = 1)) + 
  geom_line(color="deepskyblue3") +
  geom_point(color="deepskyblue3") +
  labs(title = "Annual Cycle of Precipitation at Nuqu� Center TRMM",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1998 - December 2005") +
  theme_classic()

# Grafica ciclo anual precipitacion Nuqu� Centro CHIRPS
ggplot(CicloAnual9405,
       aes(x = mes,
           y = Nuqu�.Center.CHIRPS,
           group = 1)) + 
  geom_line(color="dodgerblue3") +
  geom_point(color="dodgerblue3") +
  labs(title = "Annual Cycle of Precipitation at Nuqu� Center CHIRPS",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1994 - December 2005") +
  theme_classic()

# Grafica ciclo anual precipitacion Nuqu� Norte TRMM
ggplot(CicloAnual9405,
       aes(x = mes,
           y = Nuqu�.North.TRMM,
           group = 1)) + 
  geom_line(color="deepskyblue4") +
  geom_point(color="deepskyblue4") +
  labs(title = "Annual Cycle of Precipitation at Nuqu� North TRMM",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1998 - December 2005") +
  theme_classic()

# Grafica ciclo anual precipitacion Nuqu� Norte CHIRPS
ggplot(CicloAnual9405,
       aes(x = mes,
           y = Nuqu�.North.CHIRPS,
           group = 1)) + 
  geom_line(color="dodgerblue4") +
  geom_point(color="dodgerblue4") +
  labs(title = "Annual Cycle of Precipitation at Nuqu� North CHIRPS",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1994 - December 2005") +
  theme_classic()

###############   Bahia Simulation period    ################
# Grafica ciclo anual precipitacion Bah�a Solano Sur TRMM 
ggplot(CicloAnual9405,
       aes(x = mes,
           y = Bah�a.Solano.South.TRMM,
           group = 1)) + 
  geom_line(color="skyblue1") +
  geom_point(color="skyblue1") +
  labs(title = "Annual Cycle of Precipitation at Bah�a Solano South TRMM",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1998 - December 2005") +
  theme_classic()

# Grafica ciclo anual precipitacion Bah�a Solano Sur CHIRPS
ggplot(CicloAnual9405,
       aes(x = mes,
           y = Bah�a.Solano.South.CHIRPS,
           group = 1)) + 
  geom_line(color="steelblue1") +
  geom_point(color="steelblue1") +
  labs(title = "Annual Cycle of Precipitation at Bah�a Solano South CHIRPS",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1994 - December 2005") +
  theme_classic()

# Grafica ciclo anual precipitacion Bah�a Solano Centro TRMM
ggplot(CicloAnual9405,
       aes(x = mes,
           y = Bah�a.Solano.Center.TRMM,
           group = 1)) + 
  geom_line(color="skyblue3") +
  geom_point(color="skyblue3") +
  labs(title = "Annual Cycle of Precipitation at Bah�a Solano Center TRMM",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1998 - December 2005") +
  theme_classic()

# Grafica ciclo anual precipitacion Bah�a Solano Centro CHIRPS
ggplot(CicloAnual9405,
       aes(x = mes,
           y = Bah�a.Solano.Center.CHIRPS,
           group = 1)) + 
  geom_line(color="steelblue3") +
  geom_point(color="steelblue3") +
  labs(title = "Annual Cycle of Precipitation at Bah�a Solano Center CHIRPS",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1994 - December 2005") +
  theme_classic()

# Grafica ciclo anual precipitacion Bah�a Solano Norte TRMM
ggplot(CicloAnual9405,
       aes(x = mes,
           y = Bah�a.Solano.North.TRMM,
           group = 1)) + 
  geom_line(color="skyblue4") +
  geom_point(color="skyblue4") +
  labs(title = "Annual Cycle of Precipitation at Bah�a Solano North TRMM",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1998 - December 2005") +
  theme_classic()

# Grafica ciclo anual precipitacion Bah�a Solano Norte CHIRPS
ggplot(CicloAnual9405,
       aes(x = mes,
           y = Bah�a.Solano.North.CHIRPS,
           group = 1)) + 
  geom_line(color="steelblue4") +
  geom_point(color="steelblue4") +
  labs(title = "Annual Cycle of Precipitation at Bah�a Solano North CHIRPS",
       x = "Month",
       y = "Total Precipitation [mm]",
       subtitle = "January 1994 - December 2005") +
  theme_classic()
