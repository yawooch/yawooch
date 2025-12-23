@echo off
echo Starting webCrawlingNews.py...
python "D:/workspace/git_project/yawooch/projects/python/webCrawlingNews.py"
if errorlevel 1 (
    echo Error occurred in webCrawlingNews.py
    pause
    exit /b 1
)

echo.
echo First script completed successfully.
echo.
echo Starting improvedCrawling.py...
python "D:/workspace/git_project/yawooch/projects/python/improvedCrawling.py"
if errorlevel 1 (
    echo Error occurred in improvedCrawling.py
    pause
    exit /b 1
)

echo.
echo Second script completed successfully.
echo.

echo Starting jsonToTsv.py...
python "D:/workspace/git_project/yawooch/projects/python/jsonToTsv.py"
if errorlevel 1 (
    echo Error occurred in jsonToTsv.py
    pause
    exit /b 1
)

echo.
echo All scripts completed successfully.
pause