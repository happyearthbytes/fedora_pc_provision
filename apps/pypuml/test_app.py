# from app import start
from app import puml as pu


def test():
    with pu.PUML() as puml:
        item3 = puml.new(name="x", description="XXX")
        item1 = puml.new(name="a", description="AAA")
        item2 = puml.new(name="b", description="BBB")
        item3.act("start", item1)
        with item1:
            item1.create(item2)
            item1.act("start", item2)
            with item2:
                item2.act("initialize")
                item2.act("notify", item1)
                item1.act("stop", item2)
            item3.act("stop", item1)

    assert 1==1