
from kivy.app import App
from kivy.uix.button import  Button
from kivy.uix.textinput import TextInput
from kivy.uix.gridlayout import GridLayout
from kivy.uix.floatlayout import FloatLayout
from kivy.uix.boxlayout import  BoxLayout
from kivy.uix.label import Label
from kivy.core.window import Window
from kivy.uix.popup import Popup

def reset():
    import kivy.core.window as window
    from kivy.base import EventLoop
    if not EventLoop.event_listeners:
        from kivy.cache import Cache
        window.Window = window.core_select_lib('window', window.window_impl, True)
        Cache.print_usage()
        for cat in Cache._categories:
            Cache._objects[cat] = {}



class mainApp(App):


    # version 1.2
    def build(self):
        self.title = "dbproject "
        Window.clearcolor = (.9, .9, .9, 1)
        Window.size = (1000, 600)
        print(Window.size)
        # self.img=Image(source=".\\4052552.jpg",size_hint=(1,1))

        # self.grid=GridLayout()
        # self.box3=BoxLayout(orientation ='vertical',spacing=10,pos =(250,50),size_hint=(.3,.1))
        self.float = FloatLayout(size=(1000, 600))

        # with self.float.canvas:
        #    self.rect=Rectangle(source="4051551.jpg",size=Window.size)
        self.box_id = BoxLayout(orientation='horizontal', spacing=5, pos=(600, 450), size_hint=(.4, .15))
        #self.label_id = Label(text="ID :", size_hint=(.2, .9), color=(0, 0, 0, 11))
        self.text_id = TextInput(hint_text='your query', multiline=False, size_hint=(.6, .9))

        #self.box_id.add_widget(self.label_id)
        self.box_id.add_widget(self.text_id)
        #self.box_id.add_widget(self.btn_id)
        self.float.add_widget(self.box_id)

        self.box_submit2 = BoxLayout(orientation='horizontal', spacing=5, pos=(600, 400), size_hint=(.4, .15))
        self.btn_submit = Button(text='submit', size_hint=(.2, .5),
                             background_color=(.35, .90, .35, .8))
        self.box_submit2.add_widget(self.btn_submit)
        self.float.add_widget(self.box_submit2)

        self.box3 = BoxLayout(orientation='horizontal', spacing=5, pos=(600, 0), size_hint=(.4, 1))
        self.btn1 = Button(text='submit',pos=(600, 0), size_hint=(.4, .2),
                                 background_color=(.35, .90, .35, .8))
        self.btn2 = Button(text='submit',pos=(800, 0), size_hint=(.4, .2),
                                 background_color=(.35, .90, .35, .8))
        self.btn3 = Button(text='submit',pos=(600, 100), size_hint=(.4, .2),
                                 background_color=(.35, .90, .35, .8))
        self.btn4 = Button(text='submit',pos=(800, 100), size_hint=(.4, .2),
                                 background_color=(.35, .90, .35, .8))
        self.btn5 = Button(text='submit', pos=(600, 200),size_hint=(.4, .2),
                                 background_color=(.35, .90, .35, .8))
        self.btn6 = Button(text='submit', pos=(800, 200),size_hint=(.4, .2),
                                 background_color=(.35, .90, .35, .8))
        self.btn7 = Button(text='submit',pos=(600, 300), size_hint=(.4, .2),
                                 background_color=(.35, .90, .35, .8))
        self.btn8 = Button(text='submit',pos=(800, 300), size_hint=(.4, .2),
                                 background_color=(.35, .90, .35, .8))
        self.box3.add_widget(self.btn1)
        self.box3.add_widget(self.btn2)
        self.box3.add_widget(self.btn3)
        self.box3.add_widget(self.btn4)
        self.box3.add_widget(self.btn5)
        self.box3.add_widget(self.btn6)
        self.box3.add_widget(self.btn7)
        self.box3.add_widget(self.btn8)
        self.float.add_widget(self.box3)
        self.box_log = BoxLayout(orientation='horizontal', spacing=5, pos=(0, 0), size_hint=(.6, 1))
        self.log = TextInput(hint_text='logs', size_hint=(.9, 1))
        #self.label_log = Label(text="Logs :", size_hint=(.1, 1), color=(0, 0, 0, 11))
        #self.box_log.add_widget(self.label_log)
        self.box_log.add_widget(self.log)
        self.float.add_widget(self.box_log)

        # self.float.add_widget(self.box)

        return self.float


    def exit(self, instance):

        self.stop()
        return
if __name__ == '__main__':
    reset()
    mainApp().run()