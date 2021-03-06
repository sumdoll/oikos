#!/bin/bash
set +x

rm -rf build/
node publish build
cat > publish/deployed/shasta/deployment.json <<EOF
{
	"targets": {},
	"sources": {}
}
EOF

sed -i 's/false/true/g' publish/deployed/shasta/config.json
node publish deploy -n shasta -d publish/deployed/shasta --yes
