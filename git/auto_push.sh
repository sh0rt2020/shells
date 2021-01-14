#Usage And Tips:
#1.将此文件拷贝到工程根目录
#2.cd 到工程根目录, 执行 sh auto_push.sh
#3.私有源需要和工程根目录同级
#4.暂不支持同一个工程多个 .podspec 文件的项目
#5.auto_push.sh 权限问题：chmod 777 auto_push.sh
#6.工程根目录名称需要和 xxx.podspec 中的 xxx 保持一致（包括大小写）

# Source Spec名称
SOURCE_SPEC_NAME="specs"

# 获取项目信息
PROJECT_DIR_PATH=$(pwd)
PROJECT_NAME=${PROJECT_DIR_PATH##*/}

POD_SPEC="${PROJECT_NAME}.podspec"
POD_SPEC_JSON="${PROJECT_NAME}.podspec.json"

POD_SPEC_PATH="${PROJECT_DIR_PATH}/${POD_SPEC}"
POD_SPEC_JSON_PATH="${PROJECT_DIR_PATH}/${POD_SPEC_JSON}"

# 项目信息(for Debug)
echo "**********************************"
echo "PROJECT_DIR_PATH: ${PROJECT_DIR_PATH}"
echo "PROJECT_NAME: ${PROJECT_NAME}"

echo "POD_SPEC: ${POD_SPEC}"
echo "POD_SPEC_JSON: ${POD_SPEC_JSON}"

echo "POD_SPEC_PATH: ${POD_SPEC_PATH}"
echo "POD_SPEC_JSON_PATH: ${POD_SPEC_JSON_PATH}"
echo "**********************************"

if [ -f "${POD_SPEC_JSON}" ]; then
rm ${POD_SPEC_JSON}
fi

pod ipc spec ${POD_SPEC_PATH} >> ${POD_SPEC_JSON_PATH}

# Push Tag
# VERSION=`cat ${POD_SPEC_JSON_PATH} |awk -F"[:]" '/version/{print $2}' |awk -F "[,]" '{print $1}' |sed 's/\"//g'`
VERSION=`cat ${POD_SPEC_JSON_PATH} |awk -F"[:]" '/version/{print $2}' |awk -F "[,]" '{print $1}'|awk -F" " '{print $NR}' |sed 's/\"//g'`
echo "Tag Version: ${VERSION}"
# git tag ${VERSION}
# git push origin ${VERSION}
git push origin master
git tag -a ${VERSION}
git push --tags

if [ -f "${POD_SPEC_JSON}" ]; then
rm ${POD_SPEC_JSON}
fi

# 错误信息
function exitWithMessage(){
echo "--------------------------------"
echo "发生错误, ${1}"
echo "--------------------------------"
exit ${2}
}

# Repo 相关
PROJECT_F_DIR_PATH=$(dirname $(pwd))
REPO_DIR_PATH="${PROJECT_F_DIR_PATH}/${SOURCE_SPEC_NAME}"
echo "私有库路径：${REPO_DIR_PATH}"

cd ${REPO_DIR_PATH}

git checkout master
git pull origin master

# 创建工程Repo目录
IS_NEW_MODULE=false
if [ ! -d "${PROJECT_NAME}" ]; then
mkdir -p ${PROJECT_NAME}
IS_NEW_MODULE=true
fi

cd ${PROJECT_NAME}

# 创建对应版本的文件夹
if [ ! -d "${VERSION}" ]; then
mkdir -p ${VERSION}
else
exitWithMessage "当前已经存在${VERSION}版本" 1
fi

cd ${VERSION}

# 复制.podspec文件
cp ${POD_SPEC_PATH} .

# Push Repo
cd ../..

git checkout master
git pull origin master

git add .

if [ ${IS_NEW_MODULE} = true ]; then
git commit -m "[ADD] ${PROJECT_NAME} ${VERSION}"
else
git commit -m "[UPDATE] ${PROJECT_NAME} ${VERSION}"
fi

git push --set-upstream origin master