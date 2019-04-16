package main

import (
  "net/http"

  "github.com/labstack/echo"
  "github.com/labstack/echo/middleware"
)

func main() {
  e := echo.New()
  e.Use(middleware.Logger())
  e.GET("/", func(c echo.Context) error {
    return c.String(http.StatusOK, "Simple Apps, send output log in json format")
  })
  e.Logger.Fatal(e.Start(":1323"))
}
