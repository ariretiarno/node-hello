podTemplate(
    yaml: readTrusted('pod.yaml')
) {
    node(POD_LABEL) {
        def appName = "node"
        def appFullName
        def revision
        def message
        def repoURL
        
        stage('Checkout') {
            def scmVars = checkout([
                $class: 'GitSCM',
                branches: scm.branches,
                extensions: scm.extensions + [
                    [
                        $class: 'AuthorInChangelog'
                    ],
                    [
                        $class: 'ChangelogToBranch',
                        options: [
                            compareRemote: 'origin',
                            compareTarget: 'master'
                        ]
                    ]
                ],
                userRemoteConfigs: scm.userRemoteConfigs
                ])
            appFullName = "${appName}:${getShortCommit()}-${getTimeStamp()}"
            revision = "${scmVars.GIT_COMMIT}"
            repoURL = "${scmVars.GIT_URL}"
            echo repoURL
            message = sh(returnStdout: true, script: "git log --oneline -1 ${revision}")
        }

        // Build and push the image and notify via Discord only on PR merge to master.
        if (env.BRANCH_NAME =~ /^v\d+\.(?:\d+|x)(?:\.\d+|x)?/) {
            stage('Build and publish') {
                container('node') {
                    script {
                        sh """
                        echo hai
                        """
                    }
                }
            }
        }
    }
}
