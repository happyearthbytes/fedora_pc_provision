

class PUML:
    def __init__(self) -> None:
        self.objects = []

    def section(self, description):
        print(f"== {description} ==")

    def new(self, type="participant", name=None, description=None):
        return PUML_Object(self, type=type, name=name, description=description)

    def add(self, object):
        self.objects.append(object)

    def __enter__(self):
        return self.start()

    def start(self):
        print("@startuml")
        return self

    def __exit__(self, exc_type, exc_value, exc_tb):
        self.stop()

    def stop(self):
        print("@enduml")


class PUML_Object:
    def __init__(self, context, type="participant", name=None, description=None) -> None:
        self.context = context
        self.type = type
        self.name = name if name else "uid"
        self.description = description if description else self.name 
        print(f"{self.type} \"{self.description}\" as {self.name}")
        self.context.add(self)

    def create(self, dest):
        print(f"create {dest.name}")

    def act(self, activity: str, to=None):
        destination = to.name if to else self.name
        print(f"{self.name} -> {destination} : {activity}")

    def activate(self):
        print(f"activate {self.name}")
        return self

    def deactivate(self):
        print(f"deactivate {self.name}")

    def __enter__(self):
        return self.activate()

    def __exit__(self, exc_type, exc_value, exc_tb):
        self.deactivate()
