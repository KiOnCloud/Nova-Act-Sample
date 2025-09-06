from nova_act import NovaAct

with NovaAct(starting_page="https://nova.amazon.com/act") as nova:
    nova.act("Click learn more. Then, return the title and publication date of the blog.")