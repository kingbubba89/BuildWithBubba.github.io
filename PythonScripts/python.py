import json
import yaml

print("Hello, World!")
print("This is a Python script running in a GitHub Pages environment.")

#Lists
toolList = ["hammer", "screwdriver", "wrench"]
print("Tools I have:", toolList)
print("")

#tuples
toolTuple = ("hammer", "screwdriver", "wrench")
print("Tools I have:", toolTuple)
print("")


# DevOps profile dictionary
devops = {
    "skills": [
        "Python",
        "Docker",
        "Kubernetes"
    ],
    "tech": {
        "cloud": "AWS",
        "os": "Linux"
    },
    "years_of_experience": 0,
    "certs": [
        "None at this time lol"
    ]
}

# Pretty-print the dictionary
import pprint
pprint.pprint(devops)

#load json file for printing
with open('Json/file.json', 'w') as f:
    json.dump(devops, f, indent=4)

    print("Json file created successfully.")


    #load yaml file for printing
with open('yaml/file2.yaml', 'w') as f:
    yaml.dump(devops, f, sort_keys=False, default_flow_style=False)

    print("yaml file created successfully.")