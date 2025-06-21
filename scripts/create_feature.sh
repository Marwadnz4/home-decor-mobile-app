#!/bin/bash

#chmod +x scripts/create_feature.sh
#./scripts/create_feature.sh chat


# --------- COLORS ---------
GREEN=$'\033[0;32m'
RED=$'\033[0;91m'
NC=$'\033[0m' # No Color

# --------- INPUT ---------
if [ -z "$1" ]; then
  echo "${RED}❌ Please provide a feature name.${NC}"
  echo "Usage: ./scripts/create_feature.sh chat"
  exit 1
fi

FEATURE_NAME=$1
PAGE_NAME=$(echo "$FEATURE_NAME" | awk -F'_' '{
    output = ""
    for(i=1; i<=NF; i++){
        # تحويل الحرف الأول من كل كلمة إلى كبير، وبقية الكلمة إلى صغير
        output = output toupper(substr($i,1,1)) tolower(substr($i,2))
    }
    print output
}')
BASE_PATH="lib/src/features/$FEATURE_NAME"

# --------- FOLDERS ---------
echo "${GREEN}✅ Creating folders for feature: $FEATURE_NAME...${NC}"

mkdir -p $BASE_PATH/domain/entities
mkdir -p $BASE_PATH/domain/repositories
mkdir -p $BASE_PATH/domain/usecases

mkdir -p $BASE_PATH/data/models
mkdir -p $BASE_PATH/data/datasources
mkdir -p $BASE_PATH/data/repositories

mkdir -p $BASE_PATH/presentation/manager/cubit
mkdir -p $BASE_PATH/presentation/pages
mkdir -p $BASE_PATH/presentation/widgets

# --------- DUMMY FILES ---------
touch $BASE_PATH/domain/entities/${FEATURE_NAME}_entity.dart
touch $BASE_PATH/domain/repositories/${FEATURE_NAME}_repository.dart
touch $BASE_PATH/domain/usecases/${FEATURE_NAME}_usecase.dart

touch $BASE_PATH/data/models/${FEATURE_NAME}_model.dart
touch $BASE_PATH/data/datasources/${FEATURE_NAME}_remote_datasource.dart
touch $BASE_PATH/data/repositories/${FEATURE_NAME}_repository_impl.dart

# touch $BASE_PATH/presentation/manager/bloc/${FEATURE_NAME}_event.dart
# touch $BASE_PATH/presentation/manager/bloc/${FEATURE_NAME}_state.dart
# touch $BASE_PATH/presentation/manager/bloc/${FEATURE_NAME}_bloc.dart

touch $BASE_PATH/presentation/manager/cubit/${FEATURE_NAME}_state.dart
echo "sealed class ${PAGE_NAME}State {}
class ${PAGE_NAME}InitialState extends ${PAGE_NAME}State {}
" >> $BASE_PATH/presentation/manager/cubit/${FEATURE_NAME}_state.dart

touch $BASE_PATH/presentation/manager/cubit/${FEATURE_NAME}_cubit.dart
echo "import 'package:flutter_bloc/flutter_bloc.dart';
import '${FEATURE_NAME}_state.dart';

class ${PAGE_NAME}Cubit extends Cubit<${PAGE_NAME}State>{
  ${PAGE_NAME}Cubit() : super(${PAGE_NAME}InitialState());;
}" >> $BASE_PATH/presentation/manager/cubit/${FEATURE_NAME}_cubit.dart

touch $BASE_PATH/presentation/pages/${FEATURE_NAME}_page.dart
echo "import 'package:flutter/material.dart';

class ${PAGE_NAME}Page extends StatelessWidget {
  const ${PAGE_NAME}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}" >> $BASE_PATH/presentation/pages/${FEATURE_NAME}_page.dart

touch $BASE_PATH/presentation/widgets/${FEATURE_NAME}_widget.dart

echo "${GREEN}🎉 Feature '$FEATURE_NAME' created successfully!${NC}"
