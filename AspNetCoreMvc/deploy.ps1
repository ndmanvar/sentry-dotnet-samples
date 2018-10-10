$sentry_org="testorg-az"
$sentry_project="vslive-sandiego"
$version=sentry-cli releases propose-version

# Push
git push origin master

#Create Release
sentry-cli releases -o $sentry_org new -p $sentry_project $version

#Associate Commits
sentry-cli releases -o $sentry_org -p $sentry_project set-commits --auto $version

#Set new value for release version environment variable
$Env:SENTRY_RELEASE=$version

#Launch app
dotnet run
