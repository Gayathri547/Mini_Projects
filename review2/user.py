from tkinter import*
from tkinter import ttk
import tkinter.messagebox
import pymysql

#connection with db
class ConnectorDB:
    def __init__(self,root):
        self.root = root
        #for making title for window
        titlespace = " "
        self.root.title(40 * titlespace + "Welcome") 
        self.root.geometry("1200x1000+700+0")
        self.root.resizable(width = False, height = False)

        MainFrame = Frame(self.root,bd=10,width=800, height=700, relief = RIDGE, bg='black')
        MainFrame.grid()   

        TitleFrame = Frame(MainFrame, bd=7, width=800, height=100, relief=RIDGE)
        TitleFrame.grid(row=0, column=0)
        TopFrame3 = Frame(MainFrame, bd=5, width=800, height=500, relief=RIDGE)
        TopFrame3.grid(row=1, column =0)

        LeftFrame = Frame(TopFrame3, bd=5, width=800, height=400, padx =2, bg="black", relief=RIDGE)
        LeftFrame.pack(side=LEFT)
        LeftFrame1 = Frame(LeftFrame, bd=5, width=700, height=180, padx=20, pady=15, relief=RIDGE)
        LeftFrame1.pack(side=TOP)

        RightFrame1 = Frame(TopFrame3, bd=5, width=200, height=400, padx=2, bg="black", relief=RIDGE)
        RightFrame1.pack(side=RIGHT)
        RightFrame1a = Frame(RightFrame1, bd=5, width=100, height=300, padx=2, pady=2, relief=RIDGE)
        RightFrame1a.pack(side=TOP)
##############################################No of fields######################################################
        UserID = StringVar()
        Username = StringVar()
        Eventdate = StringVar()
        Select_an_event = StringVar()
        Timings = StringVar()
        No_of_seats = StringVar()
#################################################Functions of the Event Management System###################################################
        def iExit():
            iExit = tkinter.messagebox.askyesno("Are you sure?", "Confirm if you want to exit")
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
# This is the command I inserted in DB and fetch here
        def addData():
            if UserID.get() == "" or Username.get() == "" or Eventdate.get()=="":
                tkinter.messagebox.showerror("Warning!","Enter All the fields")
            else:
                sqlCon = pymysql.connect(host = "localhost",user="root",database="MAIN_PROJECT")
                cur = sqlCon.cursor()
                cur.execute("insert into management values(%s,%s,%s,%s,%s,%s)",(UserID.get(),Username.get(),Eventdate.get(),Select_an_event.get(),Timings.get(),No_of_seats.get()))
                sqlCon.commit()
                sqlCon.close()
                tkinter.messagebox.showinfo("Congrats","Record entered successfully")
            if Eventdate.get()=="10-11-2021":
                tkinter.messagebox.showinfo("Reminder","Hurry!!! It is in this week.")
            elif Eventdate.get()=="11-11-2021":
                tkinter.messagebox.showinfo("Reminder","Hurry!!! It is in this week.")
            elif Eventdate.get()=="12-11-2021":
                tkinter.messagebox.showinfo("Reminder","Hurry!!! It is in this week.")
            elif Eventdate.get()=="13-11-2021":
                tkinter.messagebox.showinfo("Reminder","Hurry!!! It is in this week.")
            elif Eventdate.get()=="14-11-2021":
                tkinter.messagebox.showinfo("Reminder","Hurry!!! It is in this week.")
            elif Eventdate.get()=="15-11-2021":
                tkinter.messagebox.showinfo("Reminder","Hurry!!! It is in this week.")
            elif Eventdate.get()=="16-11-2021":
                tkinter.messagebox.showinfo("Reminder","Hurry!!! It is in this week.")
            elif Eventdate.get()=="17-11-2021":
                tkinter.messagebox.showinfo("Reminder","Hurry!!! It is in this week.")
            elif Eventdate.get()=="18-11-2021":
                tkinter.messagebox.showinfo("Reminder","Hurry!!! It is in this week.")
            elif Eventdate.get()=="19-11-2021":
                tkinter.messagebox.showinfo("Reminder","Hurry!!! It is in this week.")
            elif Eventdate.get()=="20-11-2021":
                tkinter.messagebox.showinfo("Reminder","Hurry!!! It is in this week.")
            # else:
            #     tkinter.messagebox.showinfo("Reminder","Give date in DD-MM-YYYY Format")

        
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
                tkinter.messagebox.showinfo("Congrats","Reocrd Updated Successfully")   
        def deleteDB():
                sqlCon = pymysql.connect(host = "localhost",user="root",database="MAIN_PROJECT")
                cur = sqlCon.cursor()
                cur.execute("delete from management where userid=%s",UserID.get())

                sqlCon.commit()
                DisplayData()
                sqlCon.close()
                tkinter.messagebox.showinfo("For your information","Record Successfully Deleted") 
        def searchDB():
                try:
                        sqlCon = pymysql.connect(host = "localhost",user="root",database="MAIN_PROJECT")
                        cur = sqlCon.cursor()
                        cur.execute("select * from management where userid=%s",UserID.get())

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
######################################################################################################
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
        self.cboSelect_an_event['values'] = (' ','Marriage','Birthday','Anniversary','Baby Shower','Fathers day','Mothers day','Children day','Marriage day','Any party','Others')
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

        ################################################################
        #The functions are called here with command 
        # These all commands are used to get the buttons for each function
        self.btnAddNew = Button(RightFrame1a,font=('arial',16,'bold'),text="Add new",bd=4,pady=1,padx=24,width=30,height=2,command=addData).grid(row=0,column=-0,padx=1)
        self.btnDisplay = Button(RightFrame1a,font=('arial',16,'bold'),text="Display",bd=4,pady=1,padx=24,width=30,height=2,command = DisplayData).grid(row=1,column=-0,padx=1)
        self.btnUpdate = Button(RightFrame1a,font=('arial',16,'bold'),text="Update",bd=4,pady=1,padx=24,width=30,height=2,command=update).grid(row=2,column=-0,padx=1)
        self.btnDelete = Button(RightFrame1a,font=('arial',16,'bold'),text="Delete",bd=4,pady=1,padx=24,width=30,height=2,command=deleteDB).grid(row=3,column=-0,padx=1)
        self.btnSearch = Button(RightFrame1a,font=('arial',16,'bold'),text="Search",bd=4,pady=1,padx=24,width=30,height=2,command=searchDB).grid(row=4,column=-0,padx=1)
        self.btnReset = Button(RightFrame1a,font=('arial',16,'bold'),text="Reset",bd=4,pady=1,padx=24,width=30,height=2,command = Reset).grid(row=5,column=-0,padx=1)
        self.btnAddExit = Button(RightFrame1a,font=('arial',16,'bold'),text="Exit",bd=4,pady=1,padx=24,width=30,height=2,command = iExit).grid(row=6,column=-0,padx=1)




if __name__=='__main__':
    root = Tk()
    application = ConnectorDB(root)
    root.mainloop()




