from tkinter import *
from tkinter import messagebox
import tkinter.messagebox
from tkinter import ttk
import pymysql

class Login:

   def __init__(self,root):

      self.root=root
      titlespace = " "
      self.root.title(102 * titlespace + "Event Management System")
      self.root.geometry("1200x1000+700+0")
      self.root.resizable(width = False, height = False)

      self.loginform()


   def loginform(self):

      Frame_login=Frame(self.root,bg="#3D0C02")
      Frame_login.place(x=0,y=0,height=700,width=1366)

      frame_input=Frame(self.root,bg='white')
      frame_input.place(x=320,y=130,height=450,width=350)

      label1=Label(frame_input,text="Login Here",font=('times new roman',32,'bold'),fg="black",bg='white')
      label1.place(x=75,y=20)

      label2=Label(frame_input,text="Mail id",font=("times new roman",20,"bold"),fg='blue',bg='white')
      label2.place(x=30,y=95)
      
      self.email_txt=Entry(frame_input,font=("times new roman",15,"bold"),bg='lightgray')
      self.email_txt.place(x=30,y=145,width=270,height=35)
      
      label3=Label(frame_input,text="Password",font=("times new roman",20,"bold"),fg='blue',bg='white')
      label3.place(x=30,y=195)

      self.password=Entry(frame_input,font=("times new roman",15,"bold"),bg='lightgray')
      self.password.place(x=30,y=245,width=270,height=35)
      
      # btn1=Button(frame_input,text="forgot password?",cursor='hand2',font=('calibri',10),bg='white',fg='black',bd=0)
      # btn1.place(x=125,y=305)
      
      btn2=Button(frame_input,text="Login",command=self.login,cursor="hand2",font=("times new roman",15),fg="white",bg="blue",bd=0,width=15,height=1)
      btn2.place(x=90,y=340)
      
      btn3=Button(frame_input,command=self.Register,text="Not Registered?register",cursor="hand2",font=("calibri",10),bg='white',fg="black",bd=0)
      btn3.place(x=110,y=390)

      root.configure(background='black')


   def login(self):

      if self.email_txt.get()=="" or self.password.get()=="":

         messagebox.showerror("Error","All fields are required",parent=self.root)

      else:

         try:

            con=pymysql.connect(host='localhost',user='root',database='GAYATHRI_MINI_PROJECT')
            cur=con.cursor()
            cur.execute('select * from register_table where email_id=%s and password=%s',(self.email_txt.get(),self.password.get()))
            row=cur.fetchone()

            if row==None:
               
               messagebox.showerror('Error','Invalid Username And Password',parent=self.root)
               self.loginclear()
               self.email_txt.focus()

            else:

               self.appscreen()
               con.close()

         except Exception as es:

            messagebox.showerror('Error',f'Error Due to : {str(es)}',parent=self.root)

   def Register(self):
      Frame_login1=Frame(self.root,bg="#2C3539")
      Frame_login1.place(x=0,y=0,height=700,width=1366)

      frame_input2=Frame(self.root,bg='white')
      frame_input2.place(x=320,y=130,height=450,width=630)

      label1=Label(frame_input2,text="Register Here",font=('times new roman',32,'bold'),fg="black",bg='white')
      label1.place(x=45,y=20)

      label2=Label(frame_input2,text="Username",font=("times new roman",20,"bold"),fg='#342D7E',bg='white')
      label2.place(x=30,y=95)

      self.entry=Entry(frame_input2,font=("times new roman",15,"bold"),bg='lightgray')
      self.entry.place(x=30,y=145,width=270,height=35)

      label3=Label(frame_input2,text="Password",font=("times new roman",20,"bold"),fg='#342D7E',bg='white')
      label3.place(x=30,y=195)

      self.entry2=Entry(frame_input2,font=("times new roman",15,"bold"),bg='lightgray')
      self.entry2.place(x=30,y=245,width=270,height=35)

      label4=Label(frame_input2,text="Email-id",font=("times new roman",20,"bold"),fg='#342D7E',bg='white')
      label4.place(x=330,y=95)

      self.entry3=Entry(frame_input2,font=("times new roman",15,"bold"),bg='lightgray')
      self.entry3.place(x=330,y=145,width=270,height=35)

      label5=Label(frame_input2,text="Confirm Password",font=("times new roman",20,"bold"),fg='#342D7E',bg='white')
      label5.place(x=330,y=195)

      self.entry4=Entry(frame_input2,font=("times new roman",15,"bold"),bg='lightgray')
      self.entry4.place(x=330,y=245,width=270,height=35)

      btn2=Button(frame_input2,command=self.register,text="Register",cursor="hand2",font=("times new roman",15),fg="white",bg="#342D7E",bd=0,width=15,height=1)
      btn2.place(x=90,y=340)

      btn3=Button(frame_input2,command=self.loginform,text="Already Registered?Login",cursor="hand2",font=("calibri",10),bg='white',fg="black",bd=0)
      btn3.place(x=110,y=390)
      
   def register(self):
       if self.entry.get()==""or self.entry2.get()==""or self.entry3.get()==""or self.entry4.get()=="":
           messagebox.showerror("Error","All Fields Are Required",parent=self.root)
       elif self.entry2.get()!=self.entry4.get():
           messagebox.showerror("Error","Password and Confirm Password Should Be Same",parent=self.root)
       else:
        try:
            con=pymysql.connect(host='localhost',user="root",database="GAYATHRI_MINI_PROJECT")
            cur=con.cursor()
            cur.execute("select * from register_table where email_id=%s",self.entry3.get())
            row=cur.fetchone()
            
            if row!=None:
                messagebox.showerror("Error","User already Exist,Please try with another Email",parent=self.root)
                self.regclear()
                self.entry.focus()

            else:
                cur.execute("insert into register_table values(%s,%s,%s,%s)",(self.entry.get(),self.entry3.get(),self.entry2.get(),self.entry4.get()))
                con.commit()
                con.close()
                
                messagebox.showinfo("Success","Register Succesfull",parent=self.root)
                self.regclear()

        except Exception as es:
                messagebox.showerror("Error",f"Error due to:{str(es)}",parent=self.root)



   def appscreen(self):



      Frame_login=Frame(self.root,bg="white")

      Frame_login.place(x=0,y=0,height=700,width=1366)

      label1=Label(Frame_login,text="Hi! Welcome heee"

                   ,font=('times new roman',32,'bold'),

                   fg="black",bg='white')

      label1.place(x=375,y=100)

      TitleFrame = Frame(Frame_login, bd=7, width=800, height=100, relief=RIDGE)
      TitleFrame.grid(row=0, column=0)
      TopFrame3 = Frame(Frame_login, bd=5, width=800, height=500, relief=RIDGE)
      TopFrame3.grid(row=1, column =0)

      LeftFrame = Frame(TopFrame3, bd=5, width=800, height=400, padx =2, bg="black", relief=RIDGE)
      LeftFrame.pack(side=LEFT)
      LeftFrame1 = Frame(LeftFrame, bd=5, width=700, height=180, padx=20, pady=15, relief=RIDGE)
      LeftFrame1.pack(side=TOP)

      RightFrame1 = Frame(TopFrame3, bd=5, width=200, height=400, padx=2, bg="black", relief=RIDGE)
      RightFrame1.pack(side=RIGHT)
      RightFrame1a = Frame(RightFrame1, bd=5, width=100, height=300, padx=2, pady=2, relief=RIDGE)
      RightFrame1a.pack(side=TOP)

      UserID = StringVar()
      Username = StringVar()
      Eventdate = StringVar()
      Select_an_event = StringVar()
      Timings = StringVar()
      No_of_seats = StringVar()


      def iExit():
            iExit = tkinter.messagebox.askyesno("Alert!", "Confirm if you want to exit")
            if iExit > 0:
                root.destroy()
                return

      def Reset():
         self.entUserID.delete(0,END)
         self.entUsername.delete(0,END)
         self.entEventdate.delete(0,END)
         Select_an_event.set("")
         Timings.set("")
         No_of_seats.set("")

#mysql> create table management(userid varchar(12) unique not null, username varchar(45),event_date varchar(45), select_an_event varchar(45),timings varchar(45),no_of_seats varchar(45), primary key(userid));
      def addData():
         if UserID.get() == "" or Username.get() == "" or Eventdate.get()=="":
               tkinter.messagebox.showerror("Oh no...","Enter Correct Details")
         else:
               sqlCon = pymysql.connect(host = "localhost",user="root",database="MAIN_PROJECT")
               cur = sqlCon.cursor()
               cur.execute("insert into management values(%s,%s,%s,%s,%s,%s)",(UserID.get(),Username.get(),Eventdate.get(),Select_an_event.get(),Timings.get(),No_of_seats.get()))
               sqlCon.commit()
               sqlCon.close()
               tkinter.messagebox.showinfo("Hurray","Record entered successfully")
      
      def DisplayData():
               sqlCon = pymysql.connect(host = "localhost",user="root",database="MAIN_PROJECT")
               cur = sqlCon.cursor()
               cur.execute("select * from management")
               result = cur.fetchall()
               if len(result)!= 0:
                  self.user_records.delete(*self.user_records.get_children())
                  for row in result:
                           self.user_records.insert('',END,values=row)
               sqlCon.commit()
               sqlCon.close()
               # tkinter.messagebox.showinfo("Data Entry Form","Record Entered Successfully")
      def Info(ev):
               viewInfo = self.user_records.focus()
               userData = self.user_records.item(viewInfo)
               row = userData['values']
               UserID.set(row[0])
               Username.set(row[1])
               Eventdate.set(row[2])
               Select_an_event.set(row[3])
               Timings.set(row[4])
               No_of_seats.set(row[5])
      #to change any data in the table - use update
      def update():
               sqlCon = pymysql.connect(host = "localhost",user="root",database="MAIN_PROJECT")
               cur = sqlCon.cursor()
               cur.execute("update management set username=%s,event_date=%s,select_an_event=%s,timings=%s,no_of_seats=%s where userid=%s",(
               Username.get(),
               Eventdate.get(),
               Select_an_event.get(),
               Timings.get(),                        
               No_of_seats.get(),
               UserID.get()
               ))

               sqlCon.commit()
               sqlCon.close()
               tkinter.messagebox.showinfo("Hurray","Reocrd Updated Successfully")   
      def deleteDB():
               sqlCon = pymysql.connect(host = "localhost",user="root",database="MAIN_PROJECT")
               cur = sqlCon.cursor()
               cur.execute("delete from management where userid=%s",UserID.get())

               sqlCon.commit()
               DisplayData()
               sqlCon.close()
               tkinter.messagebox.showinfo("Deletion","Record Successfully Deleted") 
      def searchDB():
               try:
                     sqlCon = pymysql.connect(host = "localhost",user="root",database="MAIN_PROJECT")
                     cur = sqlCon.cursor()
                     cur.execute("select * from management where userid=%s",UserID.get())
                     # cur.execute("select * from management where username=%s",Username.get())
                     # cur.execute("select * from management where events_date=%s",Eventdate.get())
                     # cur.execute("select * from management where select_an_event=%s",Select_an_event.get())

                     row = cur.fetchone()

                     UserID.set(row[0])
                     Username.set(row[1])
                     Eventdate.set(row[2])
                     Select_an_event.set(row[3])
                     Timings.set(row[4])
                     No_of_seats.set(row[5])

                     sqlCon.commit()
               except:
                     tkinter.messagebox.showinfo("Sorry","No such record found")
                     Reset()
               sqlCon.close()


#######################################################################################################
      self.lbltitle = Label(TitleFrame, font=('arial',55,'bold'),text = "Event Management System", bd=7)
      self.lbltitle.grid(row=0, column=0, padx=132)
########################################################################################################

      self.lblUserID = Label(LeftFrame1, font=('arial',12,'bold'),text ="User ID",bd=7)
      self.lblUserID.grid(row=0,column=0, sticky=W, padx=5)
      self.entUserID = Entry(LeftFrame1, font=('arial',12,'bold'),bd=5,width=60,justify='left',textvariable = UserID)
      self.entUserID.grid(row=0, column=1, sticky=W, padx=5)

      self.lblUsername = Label(LeftFrame1, font=('arial',12,'bold'),text="Username",bd=7)
      self.lblUsername.grid(row=1,column=0, sticky=W, padx=5)
      self.entUsername=Entry(LeftFrame1, font=('arial',12,'bold'),bd=5,width=60,justify='left',textvariable = Username)
      self.entUsername.grid(row=1,column=1, sticky=W, padx=5)

      self.lblEventdate = Label(LeftFrame1, font=('arial',12,'bold'),text ="event_date",bd=7)
      self.lblEventdate.grid(row=2,column=0, sticky=W, padx=5)
      self.entEventdate = Entry(LeftFrame1, font=('arial',12,'bold'),bd=5,width=60,justify='left',textvariable=Eventdate)
      self.entEventdate.grid(row=2, column=1, sticky=W, padx=5)

      self.lblSelect_an_event =Label(LeftFrame1, font=('arial',12,'bold'),text="Select_an_event",bd=7)
      self.lblSelect_an_event.grid(row=3,column=0,sticky=W, padx=5)
      self.cboSelect_an_event = ttk.Combobox(LeftFrame1, font=('arial',12,'bold'), width=60, state='readonly',textvariable=Select_an_event)
      self.cboSelect_an_event['values'] = (' ','Marriage','Birthday','Anniversary','Baby Shower')
      self.cboSelect_an_event.current(0)
      self.cboSelect_an_event.grid(row=3,column=1)


      self.lblTimings = Label(LeftFrame1, font=('arial',12,'bold'),text="Timings",bd=5)
      self.lblTimings.grid(row=4,column=0, sticky=W, padx=5)
      self.cboTimings = ttk.Combobox(LeftFrame1, font=('arial',12,'bold'), width=60, state='readonly',textvariable=Timings)
      self.cboTimings['values']=(' ','Morning','Afternoon','Evening','Night')
      self.cboTimings.current(0)
      self.cboTimings.grid(row=4,column=1)
      

      self.lblNo_of_seats=Label(LeftFrame1, font=('arial',12,'bold'),text="No_of_seats",bd=5)
      self.lblNo_of_seats.grid(row=5,column=0,sticky=W, padx=5)
      self.cboNo_of_seats = ttk.Combobox(LeftFrame1, font=('arial',12,'bold'), width=60, state='readonly',textvariable=No_of_seats)
      self.cboNo_of_seats['values']=(' ','1','2','3','4','5','6','7','8','9','10')
      self.cboNo_of_seats.grid(row=5,column=1,sticky=W, padx=5)

      #############################################Table tree view ##########
      scroll_y = Scrollbar(LeftFrame,orient=VERTICAL)

      self.user_records=ttk.Treeview(LeftFrame,height=18, columns=("userid","username","event_date","select_an_event","timings","no_of_seats"),yscrollcommand=scroll_y.set)
      scroll_y.pack(side= RIGHT, fill=Y )

      self.user_records.heading("userid",text="UserID")
      self.user_records.heading("username",text="Username")
      self.user_records.heading("event_date",text="Eventdate")
      self.user_records.heading("select_an_event",text="Select_an_event")
      self.user_records.heading("timings",text="timings")
      self.user_records.heading("no_of_seats",text="No_of_seats")

      self.user_records['show'] = 'headings'

      self.user_records.column("userid",width=100)
      self.user_records.column("username",width=100)
      self.user_records.column("event_date",width=100)
      self.user_records.column("select_an_event",width=100)
      self.user_records.column("timings",width=100)
      self.user_records.column("no_of_seats",width=100)

      self.user_records.pack(fill=BOTH, expand=1)
      #to automatically display the data
      # DisplayData()
      #by clicking on the data, we should see at labels
      self.user_records.bind("<ButtonRelease-1>",Info)

      self.btnAddNew = Button(RightFrame1a,font=('arial',16,'bold'),text="Add new",bd=4,pady=1,padx=24,width=30,height=2,command=addData).grid(row=0,column=-0,padx=1)
      self.btnDisplay = Button(RightFrame1a,font=('arial',16,'bold'),text="Display",bd=4,pady=1,padx=24,width=30,height=2, command = DisplayData).grid(row=1,column=-0,padx=1)
      self.btnUpdate = Button(RightFrame1a,font=('arial',16,'bold'),text="Update",bd=4,pady=1,padx=24,width=30,height=2,command=update).grid(row=2,column=-0,padx=1)
      self.btnDelete = Button(RightFrame1a,font=('arial',16,'bold'),text="Delete",bd=4,pady=1,padx=24,width=30,height=2,command=deleteDB).grid(row=3,column=-0,padx=1)
      self.btnSearch = Button(RightFrame1a,font=('arial',16,'bold'),text="Search",bd=4,pady=1,padx=24,width=30,height=2,command=searchDB).grid(row=4,column=-0,padx=1)
      self.btnReset = Button(RightFrame1a,font=('arial',16,'bold'),text="Reset",bd=4,pady=1,padx=24,width=30,height=2,command = Reset).grid(row=5,column=-0,padx=1)
      self.btnAddExit = Button(RightFrame1a,font=('arial',16,'bold'),text="Exit",bd=4,pady=1,padx=24,width=30,height=2,command = iExit).grid(row=6,column=-0,padx=1)

   def regclear(self):

      self.entry.delete(0,END)

      self.entry2.delete(0,END)

      self.entry3.delete(0,END)

      self.entry4.delete(0,END)



   def loginclear(self):

      self.email_txt.delete(0,END)

      self.password.delete(0,END)




root=Tk()
ob=Login(root)
# Login(root)
root.mainloop()