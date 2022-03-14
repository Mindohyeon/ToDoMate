import ProjectDescription

let projectName = "ToDoMate"
let organizationName = "mindohyeon"

let project = Project(
    name: projectName,
    organizationName: organizationName,
    targets: [
        Target(
            name: "\(projectName)",
            platform: .iOS,
            product: .app,
            bundleId: "\(organizationName).\(projectName)",
            deploymentTarget: .iOS(targetVersion: "15.0", devices: [.iphone, .ipad]),
            infoPlist: .file(path: Path("Target/Support/Info.plist")),
            sources: ["Target/Sources/**"],
            resources: ["Target/Resources/**"]
        )
    ]
)
