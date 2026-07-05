
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color (Reset)



echo "${GREEN}Project cleaning started...${NC}"
flutter clean

echo "${GREEN}Project cache cleaning started...${NC}"
fluter clean cache

echo "${GREEN}Refreshing packages...${NC}"
flutter pub get

echo "${GREEN}Generating android release app..${NC}"
flutter build apk --release

echo "${GREEN}Build complete. You find apk in build/app/outputs/flutter-apk/${NC}"