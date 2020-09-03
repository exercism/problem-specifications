if "%~1"=="" (set PATTERN="**/*.{md,json,yml}") else (set PATTERN="%1")
npx prettier@2.1.1 --write %PATTERN%
