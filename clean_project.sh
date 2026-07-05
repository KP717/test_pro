
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color (Reset)



echo "${YELLOW}Project cleaning started...${NC}"
flutter clean

echo "${CYAN}Project cache cleaning started...${NC}"
fluter clean cache

echo "${BLUE}Refreshing packages...${NC}"
flutter pub get

echo "${GREEN}Project clean complete.${NC}"