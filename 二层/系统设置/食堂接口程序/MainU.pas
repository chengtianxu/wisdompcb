unit MainU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,EastRiver,Functions,Shellapi,PrjConst, ComCtrls, ExtCtrls,StrUtils,
  StdCtrls, Grids, Menus, Buttons, DBGridEh,OoMisc,EastRiver03,FileCtrl,ShlObj,ActiveX,
  Inifiles, common, ActnList, DBGrids, DBCtrls;



type
  TMain_Form = class(TForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Label5: TLabel;
    Label6: TLabel;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Label7: TLabel;
    Label8: TLabel;
    ListView1: TListView;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    ListView2: TListView;
    CheckBox1: TCheckBox;
    ListView3: TListView;
    CheckBox2: TCheckBox;
    Button12: TButton;
    BitBtn1: TBitBtn;
    Button5: TButton;
    Memo1: TMemo;
    Button13: TButton;
    Memo2: TMemo;
    TabSheet3: TTabSheet;
    ListView4: TListView;
    Label1: TLabel;
    ListView5: TListView;
    Label2: TLabel;
    Button16: TButton;
    Button17: TButton;
    TabSheet4: TTabSheet;
    Button14: TButton;
    DBGridEh3: TDBGridEh;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    SaveDialog1: TSaveDialog;
    Button18: TButton;
    ProgressBar1: TProgressBar;
    Label4: TLabel;
    BitBtn3: TBitBtn;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    FileListBox1: TFileListBox;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    RichEdit1: TRichEdit;
    StringGrid1: TStringGrid;
    RadioGroup1: TRadioGroup;
    Radio_mr: TRadioButton;
    Radio_ysl: TRadioButton;
    Radio_zdy: TRadioButton;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit_cs: TEdit;
    Edit_cl: TEdit;
    Button_cj: TButton;
    Button_dr: TButton;
    Button_cz: TButton;
    Edit_dvl: TEdit;
    Edit_dvs: TEdit;
    Edit_ts: TEdit;
    Edit_tl: TEdit;
    Edit_dl: TEdit;
    Edit_ds: TEdit;
    OpenDialog_loadtxt: TOpenDialog;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    TabSheet7: TTabSheet;
    Label9: TLabel;
    Label19: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    ComboBox1: TComboBox;
    Edit_t1: TEdit;
    Edit_t2: TEdit;
    Edit_t3: TEdit;
    Edit_t4: TEdit;
    Edit_t5: TEdit;
    Edit_t6: TEdit;
    Edit_t7: TEdit;
    Edit_t8: TEdit;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape3: TShape;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Button_gxcxb: TButton;
    Button_bbjcpz: TButton;
    Shape13: TShape;
    BitBtn4: TBitBtn;
    DBGridEh4: TDBGridEh;
    RadioGroup_cx: TRadioGroup;
    RadioButton_ygcx: TRadioButton;
    RadioButton_bmcx: TRadioButton;
    RadioButton_cbhz: TRadioButton;
    RadioButton_jcmx: TRadioButton;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Edit_cxgh: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button_cx: TButton;
    Button_dcjg: TButton;
    Edit_clocount1: TEdit;
    ComboBox_deplist: TComboBox;
    PopupMenu_cx: TPopupMenu;
    n1: TMenuItem;
    n2: TMenuItem;
    Label_rcdcount: TLabel;
    Label_count1: TLabel;
    ProgressBar_importdata: TProgressBar;
    StaticText_procbar: TStaticText;
    Static_twicegather: TStaticText;
    Button_resetdr: TButton;
    RadioButton_yjbb: TRadioButton;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Edit_meal1: TEdit;
    Edit_meal2: TEdit;
    Edit_meal3: TEdit;
    Edit_meal4: TEdit;
    Button_bcjfpz: TButton;
    RadioButton_yjyxbb: TRadioButton;
    N3: TMenuItem;
    CheckBox_ygc: TCheckBox;
    CheckBox_gbc: TCheckBox;
    Label32: TLabel;
    Edit_meal5: TEdit;
    Edit_meal6: TEdit;
    Edit_meal7: TEdit;
    Edit_meal8: TEdit;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label18: TLabel;
    Edit_meal9: TEdit;
    Radio_mr2: TRadioButton;
    Button15: TButton;
    TabSheet8: TTabSheet;
    Label33: TLabel;
    Edit_emplist_cx: TEdit;
    DBGridEh5: TDBGridEh;
    DBGridEh6: TDBGridEh;
    Label34: TLabel;
    PopupMenu_xuanren: TPopupMenu;
    n4: TMenuItem;
    N5: TMenuItem;
    DBNavigator1: TDBNavigator;



    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Button12Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure DBGridEh2TitleClick(Column: TColumnEh);
    procedure DBGridEh3TitleClick(Column: TColumnEh);
    procedure Button_cjClick(Sender: TObject);
    procedure Radio_mrClick(Sender: TObject);
    procedure Radio_yslClick(Sender: TObject);
    procedure Edit_csKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_clKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_dsKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_dlKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_tsKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_tlKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_dvsKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_dvlKeyPress(Sender: TObject; var Key: Char);
    procedure Action1Execute(Sender: TObject);
    procedure Button_drClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button_czClick(Sender: TObject);
    procedure Radio_zdyClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure Button_bbjcpzClick(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure Button_dcjgClick(Sender: TObject);
    procedure Button_cxClick(Sender: TObject);
    procedure RadioButton_ygcxClick(Sender: TObject);
    procedure RadioButton_bmcxClick(Sender: TObject);
    procedure RadioButton_cbhzClick(Sender: TObject);
    procedure RadioButton_jcmxClick(Sender: TObject);
    procedure DBGridEh4DblClick(Sender: TObject);
    procedure DBGridEh4TitleClick(Column: TColumnEh);
    procedure Button_gxcxbClick(Sender: TObject);
    procedure n1Click(Sender: TObject);
    procedure n2Click(Sender: TObject);
    procedure Edit_cxghKeyPress(Sender: TObject; var Key: Char);
    procedure ListView4ColumnClick(Sender: TObject; Column: TListColumn);
    procedure dataimportwait;
    procedure Button_resetdrClick(Sender: TObject);
    procedure Button_bcjfpzClick(Sender: TObject);
    procedure Action3Execute(Sender: TObject);
    procedure Edit_meal1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit_meal2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit_meal3KeyPress(Sender: TObject; var Key: Char);
    procedure Edit_meal4KeyPress(Sender: TObject; var Key: Char);
    procedure N3Click(Sender: TObject);
    procedure RadioButton_yjbbClick(Sender: TObject);
    procedure RadioButton_yjyxbbClick(Sender: TObject);
    procedure CheckBox_ygcClick(Sender: TObject);
    procedure CheckBox_gbcClick(Sender: TObject);
    procedure Edit_meal5KeyPress(Sender: TObject; var Key: Char);
    procedure Edit_meal6KeyPress(Sender: TObject; var Key: Char);
    procedure Edit_meal7KeyPress(Sender: TObject; var Key: Char);
    procedure Edit_meal8KeyPress(Sender: TObject; var Key: Char);
    procedure Radio_mr2Click(Sender: TObject);
    procedure Edit_emplist_cxChange(Sender: TObject);
    procedure Button_bcwpClick(Sender: TObject);
    procedure n4Click(Sender: TObject);
    procedure PopupMenu_xuanrenPopup(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DBGridEh6TitleClick(Column: TColumnEh);
    procedure DBGridEh6Enter(Sender: TObject);
    procedure DBGridEh6Exit(Sender: TObject);





  private
      PreColumn: TColumnEh;
      field_name:string;
      PreColumn2: TColumnEh;
      field_name2:string;
      PreColumn3: TColumnEh;
      field_name3:string;
    { Private declarations }
  public
   //  function GetClk:TClockInfo;
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;
  tdlist:TDeviceList;
  CLK:TClockInfo;


function NewClosePort(pclk: PClockInfo): Boolean;
function NewOpenPort(pclk: PClockInfo): Boolean;


implementation

uses UDM, modify_card, dataimport_thread, dataimport_show;

{$R *.dfm}
function ExecuteFile(const FileName, Params, DefaultDir: String; ShowCmd: Integer): THandle;
var
zFileName, zParams, zDir: array[0..79] of Char;
begin
Result :=ShellExecute(Application.MainForm.Handle, nil,StrPCopy(zFileName, FileName), StrPCopy(zParams, Params), StrPCopy(zDir, DefaultDir), ShowCmd);
end;




function   SelectDirCB(Wnd:   HWND;   uMsg:   UINT;   lParam,   lpData:   LPARAM):   Integer   stdcall;  
  begin  
      if   (uMsg   =   BFFM_INITIALIZED)   and   (lpData   <>   0)   then  
          SendMessage(Wnd,   BFFM_SETSELECTION,   Integer(True),   lpdata);  
      result   :=   0;  
  end;  


function   SelectDirectory(const   Caption:   string;   const   Root:   WideString;  
      var   Directory:   string;   Owner:   THandle):   Boolean;  
var
      WindowList:   Pointer;  
      BrowseInfo:   TBrowseInfo;
      Buffer:   PChar;  
      RootItemIDList,   ItemIDList:   PItemIDList;  
      ShellMalloc:   IMalloc;  
      IDesktopFolder:   IShellFolder;  
      Eaten,   Flags:   LongWord;  
begin
      Result   :=   False;  
      if   not   DirectoryExists(Directory)   then  
          Directory   :=   '';  
      FillChar(BrowseInfo,   SizeOf(BrowseInfo),   0);  
      if   (ShGetMalloc(ShellMalloc)   =   S_OK)   and   (ShellMalloc   <>   nil)   then  
      begin  
          Buffer   :=   ShellMalloc.Alloc(MAX_PATH);  
          try
              RootItemIDList   :=   nil;  
              if   Root   <>   ''   then  
              begin  
                  SHGetDesktopFolder(IDesktopFolder);
                  IDesktopFolder.ParseDisplayName(Application.Handle,   nil,
                      POleStr(Root),   Eaten,   RootItemIDList,   Flags);  
              end;  
              with   BrowseInfo   do  
              begin  
                  hwndOwner   :=   Owner;   //Application.Handle;  
                  pidlRoot   :=   RootItemIDList;  
                  pszDisplayName   :=   Buffer;  
                  lpszTitle   :=   PChar(Caption);  
                  ulFlags   :=   BIF_RETURNONLYFSDIRS;  
                  if   Directory   <>   ''   then  
                  begin  
                      lpfn   :=   SelectDirCB;
                      lParam   :=   Integer(PChar(Directory));  
                  end;  
              end;  
              WindowList   :=   DisableTaskWindows(0);  
              try
                  ItemIDList   :=   ShBrowseForFolder(BrowseInfo);
              finally  
                  EnableTaskWindows(WindowList);  
              end;  
              Result   :=     ItemIDList   <>   nil;  
              if   Result   then  
              begin  
                  ShGetPathFromIDList(ItemIDList,   Buffer);  
                  ShellMalloc.Free(ItemIDList);  
                  Directory   :=   Buffer;  
              end;  
          finally  
              ShellMalloc.Free(Buffer);  
          end;  
      end;
end;


{function DataProgressProc(p: Pointer; lpReadData: PReadData): Boolean;stdcall;
  procedure WriteRecord(icount:integer;DevId:integer;Records:array of TICRecord);
   var
      FilePath:string;
      fp:TextFile;
      str:string;
      i:integer;
   begin
      FilePath:=ExtractFilePath(Application.ExeName);
      FilePath:=FilePath+'Time'+FormatDateTime('yyyyMMdd',now)+'.txt';
      try
        AssignFile(fp, FilePath);
        if FileExists(FilePath) then
        begin
          Append(fp);
        end
        else
        begin
         rewrite(fp);
        end;
        for i:=0 to icount-1 do
        begin
          str:=Format('%d   %s  %d  %s ',[DevId,Records[i].timeString,Records[i].flag,Records[i].Card,Records[i].EmpId]);
          writeln(fp, str);
        end;
      finally
        CloseFile(fp);
      end;
   end;
var
  clk: PClockInfo;
  Records:array[0..16] of TICRecord;
begin
  FillChar(Records,sizeof(Records),0);
  Move(lpReadData^.CardNo[0],Records[0].Card[0],sizeof(lpReadData^.CardNo));
  Move(lpReadData^.TimeString[0],Records[0].timeString[0],sizeof(lpReadData.TimeString));
  Records[0].flag:=lpReadData.flag;
  WriteRecord(1, lpReadData.Clock_ID,Records);
  Result:=true;
end;
}
function DataProgressProc(p: Pointer; lpReadData: PReadData): Boolean;stdcall;
  procedure WriteRecord(icount:integer;DevId:integer;Records:array of TICRecord);
   var
      FilePath:string;
      fp:TextFile;
      str:string;
      i:integer;
   begin
      FilePath:=ExtractFilePath(Main_Form.Edit1.Text);
      FilePath:=Main_Form.Edit1.Text;
      try
        AssignFile(fp, FilePath);
        if FileExists(FilePath)//如果文件名已经存在
        then
        begin
          Append(fp);
        end
        else
        begin
         rewrite(fp);
        end;

        for i:=0 to icount-1 do
        begin
          str:=Format('%2d   %s  %d  %s ',[DevId,Records[i].timeString,Records[i].flag,Records[i].Card,Records[i].EmpId]);
          writeln(fp, str);
          {
          if DM.ADOConnection1.Connected then
          begin
              try
               dm.ADOConnection1.BeginTrans;
                with DM.ADORCD1 do
                begin
                        Close;
                        sql.Text:= '';
                        sql.Text:='INSERT INTO employeecard_eastriver_rcd_'+leftstr(main_form.ComboBox1.Text,2)+' (employeecard,remark3,dev_id)'+#13+
                                    'values('+#39+Records[i].Card+#39+','+#39+Records[i].timeString+#39+','+#39+inttostr(DevId)+#39+')';
                        ExecSQL;
                end;
                 dm.ADOConnection1.CommitTrans;
               except
                 on E: Exception do
                 begin
                   dm.ADOConnection1.RollbackTrans;
                   messagedlg(E.Message,mterror,[mbcancel],0);
                 end;
              end;  
          end;    }
        end;
     finally
     CloseFile(fp);
     end;
   end;
var
  Records:array[0..2] of TICRecord;
begin
  FillChar(Records,sizeof(Records),0);

  Move(lpReadData^.CardNo[0],Records[0].Card[0],sizeof(lpReadData^.CardNo));
  Move(lpReadData^.TimeString[0],Records[0].timeString[0],sizeof(lpReadData.TimeString));
  Records[0].flag:=lpReadData.flag;
  WriteRecord(1, lpReadData.Clock_ID,Records);
  Result:=true;
end;

procedure WaitProc(p: Pointer; dwMilliseconds: Integer);stdcall;
begin
  Application.ProcessMessages;
end;

function checkexist(EmpId:string): Boolean;
var
    iPos,iCount,k: Integer;
    ListCards: NameListArray;
begin

              Result:=False;
              iCount:=1;
              if NewOpenPort(@CLK) then
               begin
                  iPos:=0;
                  fillChar(ListCards,sizeof(ListCards),0);
                  while iCount>0 do
                  begin
                    iCount:=8;
                    if eastriver.ReadDeviceListCard(CLK.hPort, iPos,iCount,ListCards) then
                    begin
                      for k:=0 to iCount do
                      begin
                          if  ListCards[k].listtype = 1 then
                          begin
                              if (ListCards[k].cardno = EmpId) then
                              begin
                                  result:=True;
                              end;
                          end;
                      end;
                    end;
                    iPos:=iPos+8;
                  end;
               end;
              NewClosePort(@clk);
end;

function NewOpenPort(pclk: PClockInfo): Boolean;
var
   Model:integer;
   Ver:double;
   cls:integer;
begin
    Result:=false;
    pclk.hPort:=OpenClientSocket(PCHar(pclk.IPAddr), pclk.IPPort);  
    if CheckHandle(pclk.hPort) then
    begin
        Result:=CallClock(pclk.hPort, pclk.clock_id);
    end;
    if not Result then
    begin
     Eastriver.GetClockModel(pclk.hPort,Model,Ver,cls);
     MsgBox(format(msg_connect_clock_fail_tcp, [pclk.IPAddr, pclk.clock_id]), MB_ICONERROR);
    end;
    
end;

function NewClosePort(pclk: PClockInfo): Boolean;
begin
     Result:=False;
     if Assigned(pclk) then
     begin
          if CheckHandle(pclk.hPort) then
          begin
               UnCallClock(pclk.hPort);    //**
               CloseClientSocket(pclk.hPort);  //**
          end;
          Result:=True;
     end;
     pclk.hPort:=0;
end;

function SetCLK(IP: string; port:string;clock_id:string):TClockInfo;
begin

      FillChar(Result,sizeof(Result),0);
      Result.CommStyle:=1;    //TCP/IP协议连接
     Result.IPAddr:=IP;
     Result.IPPort:=StrToIntDef(Port,0);
     Result.clock_id:=StrToIntdef(clock_id,0);
end;


procedure TMain_Form.Button1Click(Sender: TObject);
var
//    DeviceType = record
 //1   Version: double;                                        ///设备软件版本
 //2   VerOrd:integer;                                         ///第几代协议
 //   DevType: integer;                                       ///设备型号
 //   Serial_Num: array[0..15] of char;                       ///设备序列号
 // 5  DevModel: Integer;                                      ///设备型号
 //   Cls: Integer;                                           ///读头类型, 0:ID, 1:IC,2:混合,3:CPU
 //   clocktype: integer;                                     //设备用途  考勤机 1:门禁机 2:消费机
 //   Devname: array[0..20] of char;                          //设备别名
 //   MAC:array[0..20] of char;                               //设备MAC地址
 //10   DevUse: integer;                                        //设备用途

 //  dev_id: Integer;                                        ///机号
 //   ComPort: Integer;                                       ///Com口
 //  ComBaudRate: integer;                                   //串行波特率
 //   IPAddress: array[0..15] of char;                        ///IP地址
 //15   IPPort: Integer;                                        ///IP端口
 //   USBPath: array[0..127] of char;                          ///USB设备路径
 //   CommType: Integer;                                      ///通讯方式, 0:RS232,1:TCP/IP,2:UDP,3:USB
num,i:integer;
begin
        ListView1.Clear;
        if SearchLanDevice(tdlist,num) then
        if num>0 then
        begin
        for i:=0 to num do
            if (tdlist[i].DevType.VerOrd=4) then
            begin
                
                 ListView1.Items.Add;
                 ListView1.items[i].Caption:='';
                 ListView1.Items[i].SubItems.Add(IntToStr(tdlist[i].pConnParam.dev_id));
               //  dlist.Items[i].SubItems.Add(IntToStr(i));
               //  dlist.Items[i].SubItems.Add(FloatToStr  (tdlist[i].DevType.Version ));
               //  dlist.Items[i].SubItems.Add( IntToStr((tdlist[i].DevType.VerOrd )));
               //  dlist.Items[i].SubItems.Add( IntToStr((tdlist[i].DevType.DevModel )));
               //  dlist.Items[i].SubItems.Add( tdlist[i].DevType.Serial_Num);
               //  dlist.Items[i].SubItems.Add( IntToStr(tdlist[i].pConnParam.dev_id));
               //  dlist.Items[i].SubItems.Add( IntToStr(tdlist[i].pConnParam.ComPort));
               //  dlist.Items[i].SubItems.Add( IntToStr(tdlist[i].pConnParam.ComBaudRate));
               //  dlist.Items[i].SubItems.Add( IntToStr(tdlist[i].DevType.Cls));
                 ListView1.Items[i].SubItems.Add(tdlist[i].pConnParam.IPAddress);
                 ListView1.Items[i].SubItems.Add(IntToStr(tdlist[i].pConnParam.IPPort));
                 case  (tdlist[i].DevType.clocktype) of
                  0:
                      ListView1.Items[i].SubItems.Add('考勤机');
                  1:
                      ListView1.Items[i].SubItems.Add('门禁机');
                  2:
                      ListView1.Items[i].SubItems.Add('消费机');
                end;
                case  (tdlist[i].pConnParam.CommType) of
                  0:
                       ListView1.Items[i].SubItems.Add('RS232通信');
                  1:
                       ListView1.Items[i].SubItems.Add('TCP/IP通信');
                  2:
                       ListView1.Items[i].SubItems.Add('UDP通信');
                  3:
                       ListView1.Items[i].SubItems.Add('USB通信');

              end;
            end;
        end;
end;

procedure TMain_Form.FormShow(Sender: TObject);
begin
      PageControl1.ActivePageIndex :=0;
      Memo1.Text:='';
      Memo2.Text:='';
end;

procedure TMain_Form.BitBtn1Click(Sender: TObject);
var
  h,m,s,i:Integer;
  db:Double;
  dt:TDateTime;
  dstring1,dstring2,dstring3: string;
begin
     formatdatetime('yyyy-mm-dd hh:mm:ss',now);
     StatusBar1.SimpleText := '';
     h:=0;m:=0;s:=0;
     if ListView1.Items.Count = 0 then
     begin
         ShowMessage('没有设备列表，请先搜索设备');
         Abort;
     end else
     begin
        for i:=0 to ListView1.Items.Count-1 do
        begin
           if ListView1.Items.Item[i].Checked then
           begin

            CLK:=SetCLK(string(ListView1.Items.Item[i].SubItems[1]),string(ListView1.Items.Item[i].SubItems[2]),string(ListView1.Items.Item[i].SubItems[0]));
            if NewOpenPort(@clk) then
            begin
                      if ReadClockTime(CLK.hPort,db) then
                      begin
                         dt:=TDateTime(db);
                         dstring1:= DateTimetoStr(dt);
                         //ShowMessage(dstring1);
                         dstring3:= Copy(dstring1,11,4);
                         dstring2:= Copy(dstring1,17,Pos(':',dstring1));
                         s:= StrToInt(Copy(dstring1,17,2))+1;
                         m:= StrToInt(Copy(dstring1,14,2));
                         h:= StrToInt(Copy(dstring1,11,2));
                      end;
                      if Eastriver.SetRing(clk.hPort,h,m,s,1) then
                       delayticks(30,true);//延时
                       eastriver.clearRing(CLK.hPort);

                 StatusBar1.SimpleText := '连接成功....';
                 ListView1.Items[i].SubItems.Add('连接成功');

              end;
               NewClosePort(@clk);
           end;
        end;
     end;
end;


procedure TMain_Form.Button12Click(Sender: TObject);
var
  CLK:TClockInfo;
  db:Double;
  dt:TDateTime;
  i:Integer;
begin
   Memo1.Text:='';
   if ListView1.Items.Count = 0 then
     begin
         ShowMessage('没有设备列表，请先搜索设备');
         Abort;
     end else
     begin
           for i:=0 to ListView1.Items.Count-1 do
           begin
             if ListView1.Items.Item[i].Checked then
             begin

                CLK:=SetCLK( string(ListView1.Items.Item[i].SubItems[1]),string(ListView1.Items.Item[i].SubItems[2]),string(ListView1.Items.Item[i].SubItems[0]));
                   if NewOpenPort(@CLK) then
                   begin
                      if ReadClockTime(CLK.hPort,db) then
                      begin
                        dt:=TDateTime(db);
                        Memo1.Lines.Add('考勤机'+string(ListView1.Items.Item[i].SubItems[0])+'号机时间：'+DateTimetoStr(dt));
                      end;
                   end;
                   NewclosePort(@CLK);
              end;
           end;
     end;
     Memo1.SelStart :=1;
end;

procedure TMain_Form.PageControl1Change(Sender: TObject);
var
  i,res,j:Integer;
  myinifile3:tinifile;
  myinifile4:tinifile;
  filepath3:string;
  filepath4:string;
begin
  PageControl1.Pages[7].Visible:=false;

  res:=0;
   for i:=0 to ListView1.Items.Count-1 do
      if ListView1.Items.Item[i].Checked then
        res:= 1;
   if (res = 0) and  (pagecontrol1.TabIndex in [1,2,3]) then
   begin
      ShowMessage('您尚未选择需要更新的设备，请选择。');
      PageControl1.TabIndex := 0 ;
   end;   //切换到其他窗口时，更新查询语句
          dm.ADOConnection1.Connected:=true;//add by xwj
          DM.ADOADD1.Close ;
          dm.ADOADD1.SQL.Text:='';
          dm.ADOADD1.SQL.Text:='SELECT  employeecode, cardno_dec, employeename, factorytype as factorytype1,'+
          'factorytype FROM dbo.employeecard_eastriver_needadd_'+leftstr(main_form.ComboBox1.Text,2)+' order by  employeecode ';
          DM.ADOREDU1.Close ;
          DM.ADOREDU1.SQL.Text:='';
          DM.ADOREDU1.SQL.Text:='SELECT  employeecode, cardno_dec, employeename, factorytype as factorytype1,factorytype'+
          ' FROM  dbo.employeecard_eastriver_needremove_'+leftstr(main_form.ComboBox1.Text,2)+' order by  employeecode ';
          DM.ADORCD1.Close;
          DM.ADORCD1.SQL.Text:='';
          DM.ADORCD1.SQL.Text:='SELECT  id, empno, employeecard, card_time, date_e, time_e, dev_id, dev_mark, empid, remark1, remark2, remark3, factorytype,'+
           ' factorytype  as factorytype1 FROM  employeecard_eastriver_rcd_'+leftstr(main_form.ComboBox1.Text,2);
          dm.ADODataSet_cx.Close;
          dm.ADODataSet_cx.CommandText:='';
          dm.ADODataSet_cx.CommandText:='select departmentname as 部门,empid as 工号,empname as 姓名,sum(breakfast) as 早餐,'+
'sum(lunch) as 午餐 ,sum(supper)as 晚餐,sum([night snack]) as 宵夜,sum(invalid_card) as 无效卡  from dbo.View_canci_'+leftstr(main_form.ComboBox1.Text,2)+
 ' where meal_date >='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)) +
 ' and  meal_date <='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date)) +
 ' group by departmentname,empname,empid'+
 ' order by departmentname,empname';
   case  PageControl1.ActivePageIndex of
       1: begin
              if DM.ADOConnection1.Connected then
              begin
                      try
                           dm.ADOConnection1.BeginTrans;
                           with DM.ADOTMP do
                            begin
                                   Close;
                                   SQL.Text:= '';
                                   SQL.Text:='exec update_emp_list_'+leftstr(main_form.ComboBox1.Text,2) ;
                                   ExecSQL;
                            end;
                         dm.ADOConnection1.CommitTrans;
                      except
                             on E: Exception do
                             begin
                               dm.ADOConnection1.RollbackTrans;
                               messagedlg(E.Message,mterror,[mbcancel],0);
                             end;
                      end;
                  DM.ADOADD1.Open;
                  DM.ADOREDU1.Open;
              end;
          end;

       3:
          begin
             if DM.Adoconnection1.Connected then
             begin
                   DM.ADORCD1.Close;
                   DM.ADORCD1.Open;
             end;
             edit1.text := '';
             edit1.text := 'D:\刷卡数据采集\'+'数据采集'+FormatDateTime('yyyyMMddHHmmSS',now)+main_form.Static_twicegather.Caption+'.txt';
          end;
     { 4:
         begin
          richedit1.Clear;
           for i:=0 to stringgrid1.RowCount do
           begin
           stringgrid1.Rows[i].Clear;
           end;
           stringgrid1.RowCount:=5;
           stringgrid1.ColCount:=5;

         end;  }
       5:
          begin
               filepath4:=ExtractFilePath(Paramstr(0))+'HRCONFIG.ini';
          myinifile4:=tinifile.Create(filepath4);
          edit_meal1.Text:=myinifile4.ReadString('4','meal1','0');
          edit_meal2.Text:=myinifile4.ReadString('4','meal2','0');
          edit_meal3.Text:=myinifile4.ReadString('4','meal3','0');
          edit_meal4.Text:=myinifile4.ReadString('4','meal4','0');
          edit_meal5.Text:=myinifile4.ReadString('4','meal5','0');
          edit_meal6.Text:=myinifile4.ReadString('4','meal6','0');
          edit_meal7.Text:=myinifile4.ReadString('4','meal7','0');
          edit_meal8.Text:=myinifile4.ReadString('4','meal8','0');
          edit_meal9.Text:=myinifile4.ReadString('4','meal9','0');
          myinifile4.Destroy;
          edit_meal1.Enabled:=false;
          edit_meal2.Enabled:=false;
          edit_meal3.Enabled:=false;
          edit_meal4.Enabled:=false;
          edit_meal5.Enabled:=false;
          edit_meal6.Enabled:=false;
          edit_meal7.Enabled:=false;
          edit_meal8.Enabled:=false;
          edit_meal9.Enabled:=false;
          Button_bcjfpz.Enabled:=false;

                 if DM.Adoconnection1.Connected then
             begin
                 combobox_deplist.Items.Clear;
                 combobox_deplist.Items.Append('全厂');
                 dm.ADODataSet_cx.Active:=false;
                 dm.ADODataSet_deplist.Close;
                 dm.ADODataSet_deplist.CommandText:=''+
                ' select distinct departmentname from dbo.View_canci_'+leftstr(main_form.ComboBox1.Text,2)+
                ' order by departmentname';
                 dm.ADODataSet_deplist.Open;
                 //combobox_deplist.Items.Count:=strtoint(dm.ADODataSet_deplist.DataSetField.)
                 //dm.ADODataSet_deplist.re
                 dm.ADODataSet_deplist.First;
                 while not dm.ADODataSet_deplist.eof do
                begin
                combobox_deplist.Items.Append(dm.ADODataSet_deplist.FieldByName('departmentname').AsString);
                //ShowMessage(dm.ADODataSet_deplist.FieldByName('departmentname').AsString);
                dm.ADODataSet_deplist.Next;
                end;
                dm.ADODataSet_deplist.Close;
              

             end;
             datetimepicker1.Date:=date;
             datetimepicker2.Date:=date;
             dbgrideh4.PopupMenu:=nil;

          end;
        6:
         begin
          filepath3:=ExtractFilePath(Paramstr(0))+'HRCONFIG.ini';
          myinifile3:=tinifile.Create(filepath3);
          edit_t1.Text:=myinifile3.ReadString('3','t1','0');
          edit_t2.Text:=myinifile3.ReadString('3','t2','0');
          edit_t3.Text:=myinifile3.ReadString('3','t3','0');
          edit_t4.Text:=myinifile3.ReadString('3','t4','0');
          edit_t5.Text:=myinifile3.ReadString('3','t5','0');
          edit_t6.Text:=myinifile3.ReadString('3','t6','0');
          edit_t7.Text:=myinifile3.ReadString('3','t7','0');
          edit_t8.Text:=myinifile3.ReadString('3','t8','0');
          edit_meal1.Text:=myinifile3.ReadString('4','meal1','0');
          edit_meal2.Text:=myinifile3.ReadString('4','meal2','0');
          edit_meal3.Text:=myinifile3.ReadString('4','meal3','0');
          edit_meal4.Text:=myinifile3.ReadString('4','meal4','0');
          edit_meal5.Text:=myinifile3.ReadString('4','meal5','0');
          edit_meal6.Text:=myinifile3.ReadString('4','meal6','0');
          edit_meal7.Text:=myinifile3.ReadString('4','meal7','0');
          edit_meal8.Text:=myinifile3.ReadString('4','meal8','0');
          edit_meal9.Text:=myinifile3.ReadString('4','meal9','0');
          myinifile3.Destroy;
          edit_t1.Enabled:=false;
          edit_t2.Enabled:=false;
          edit_t3.Enabled:=false;
          edit_t4.Enabled:=false;
          edit_t5.Enabled:=false;
          edit_t6.Enabled:=false;
          edit_t7.Enabled:=false;
          edit_t8.Enabled:=false;
          edit_meal1.Enabled:=false;
          edit_meal2.Enabled:=false;
          edit_meal3.Enabled:=false;
          edit_meal4.Enabled:=false;
          edit_meal5.Enabled:=false;
          edit_meal6.Enabled:=false;
          edit_meal7.Enabled:=false;
          edit_meal8.Enabled:=false;
          edit_meal9.Enabled:=false;
          Button_bbjcpz.Enabled:=false;
          Button_gxcxb.Enabled:=false;
          Button_bcjfpz.Enabled:=false;
         end;


     { 7:
        begin
             if DM.Adoconnection1.Connected then
             begin
             dm.ADOTMP.SQL.Clear;
             dm.ADOTMP.SQL.Text:='insert into T_jshr_employee '+
'select id,empname,departmentcode from jshr..employee where id not in (select employeeid from T_jshr_employee)  ' ;
          try
          dm.ADOTMP.ExecSQL;
          dm.ADODataSet_emplist.Active:=false;
          dm.ADOdataset_emplist.CommandText:='select top 25 employeeid as 工号,employeename as 姓名 from T_jshr_employee'+
          ' where  employeeid not in (select employeecode from employeecard_factory_guest)'+
'and left(departmentcode,2)<>'+quotedstr(leftstr(main_form.ComboBox1.Text,2));
dm.ADODataSet_emplist.Active:=true;
          except
          showmessage('名单索引失败');
          end;
             end;
dm.ADODataSet_emptrip.Active:=false;
          dm.ADODataSet_emptrip.CommandText:='select  orginal_factorytype as 职属工厂,'+
' department as 部门,employeecode as 工号 ,employeename as 姓名, '+
' cardno_dec as 十进制卡号,cardno_hex as 十六进制卡号,            '+
' business_trip_begintime as 出差登记日期 ,                       '+
' business_trip_endtime as  出差结束日期 ,                        '+
' case when trip_factorytype='+#39+'01'+#39+' then '+#39+'深圳五洲'+#39+
'     when trip_factorytype='+#39+'02'+#39+' then '+#39+'梅州一厂'+#39+
'     when trip_factorytype='+#39+'03'+#39+' then '+#39+'梅州二厂'+#39+
'     when trip_factorytype='+#39+'04'+#39+' then '+#39+'东莞五株'+#39+
'     when trip_factorytype='+#39+'05'+#39+' then '+#39+'东莞威力固'+#39+
'     when trip_factorytype='+#39+'06'+#39+' then' +#39+'东莞浩远'+#39+' else '+#39+'未知单位'+#39+' end as 出差地点 '+
'     from dbo.employeecard_factory_guest    where  trip_factorytype='+quotedstr(leftstr(main_form.ComboBox1.Text,2)) ;
dm.ADODataSet_emptrip.Active:=true;
DBGridEh6.Columns.RebuildColumns;
dbgrideh6.Columns.Items[0].Width:=50;
dbgrideh6.Columns.Items[1].Width:=80;
dbgrideh6.Columns.Items[2].Width:=40;
dbgrideh6.Columns.Items[3].Width:=40;
dbgrideh6.Columns.Items[4].Width:=65;
dbgrideh6.Columns.Items[5].Width:=55;
dbgrideh6.Columns.Items[6].Width:=60;
dbgrideh6.Columns.Items[7].Width:=60;
dbgrideh6.Columns.Items[8].Width:=50;
dbgrideh6.Columns.Items[0].ReadOnly:=true;
dbgrideh6.Columns.Items[1].ReadOnly:=true;
dbgrideh6.Columns.Items[2].ReadOnly:=true;
dbgrideh6.Columns.Items[3].ReadOnly:=true;
dbgrideh6.Columns.Items[4].ReadOnly:=true;
dbgrideh6.Columns.Items[5].ReadOnly:=true;
dbgrideh6.Columns.Items[8].ReadOnly:=true; 
dbgrideh5.PopupMenu:=PopupMenu_xuanren;
PopupMenu_xuanren.Items.Items[0].Enabled:=true;
PopupMenu_xuanren.Items.Items[1].Enabled:=false;
dbnavigator1.Enabled:=false;



 //肖文举
         end;      }




      else
          begin
              DM.ADOADD1.Close ;
              DM.ADOREDU1.Close ;
              DM.ADORCD1.Close;
          end;
    end;


end;

procedure TMain_Form.Button4Click(Sender: TObject);
var
  i: Integer;
begin
      ListView2.Clear;
      if DM.Adoconnection1.Connected then
      begin
           DM.ADOADD1.Close ;
           DM.ADOADD1.Open;
           if not DM.ADOADD1.IsEmpty then
           begin
            DM.ADOADD1.First;
            i:=0;
            while  not DM.ADOADD1.Eof do
            begin

                ListView2.Items.Add;
                ListView2.items[i].Caption:='';
                ListView2.Items[i].Checked := True;
                ListView2.Items[i].SubItems.Add(DM.ADOADD1.fieldbyname('employeecode').AsString);
                ListView2.Items[i].SubItems.Add(DM.ADOADD1.fieldbyname('employeename').AsString);
                ListView2.Items[i].SubItems.Add(DM.ADOADD1.fieldbyname('cardno_dec').AsString);
                ListView2.Items[i].SubItems.Add(DM.ADOADD1.fieldbyname('factorytype1').AsString);
                ListView2.Items[i].SubItems.Add(DM.ADOADD1.fieldbyname('factorytype').AsString);
             inc(i);
             DM.ADOADD1.Next;
            end;
           end;
           DM.ADOADD1.First;
      end;
end;


procedure TMain_Form.CheckBox1Click(Sender: TObject);
var
    i: Integer;
begin
     if CheckBox1.Checked = True then
     begin
         for i:=0 to ListView2.Items.Count-1 do
         ListView2.Items[i].Checked := True;
     end else
     begin
          for i:=0 to ListView2.Items.Count-1 do
         ListView2.Items[i].Checked := False;
     end;
end;

procedure TMain_Form.Button9Click(Sender: TObject);
var
  i: Integer;
begin
      ListView3.Clear;
      if DM.Adoconnection1.Connected then
      begin
           DM.ADOREDU1.Close ;
           DM.ADOREDU1.Open;
           if not DM.ADOREDU1.IsEmpty then
           begin
            DM.ADOREDU1.First;
            i:=0;
            while  not DM.ADOREDU1.Eof do
            begin

                ListView3.Items.Add;
                ListView3.items[i].Caption:='';
                ListView3.Items[i].Checked := True;
                ListView3.Items[i].SubItems.Add(DM.ADOREDU1.fieldbyname('employeecode').AsString);
                ListView3.Items[i].SubItems.Add(DM.ADOREDU1.fieldbyname('employeename').AsString);
                ListView3.Items[i].SubItems.Add(DM.ADOREDU1.fieldbyname('cardno_dec').AsString);
                ListView3.Items[i].SubItems.Add(DM.ADOREDU1.fieldbyname('factorytype1').AsString);
                ListView3.Items[i].SubItems.Add(DM.ADOREDU1.fieldbyname('factorytype').AsString);
             inc(i);
             DM.ADOREDU1.Next;
            end;
           end;
           DM.ADOREDU1.First;
      end;
end;

procedure TMain_Form.CheckBox2Click(Sender: TObject);
var
    i: Integer;
begin
     if CheckBox2.Checked = True then
     begin
         for i:=0 to ListView3.Items.Count-1 do
         ListView3.Items[i].Checked := True;
     end else
     begin
          for i:=0 to ListView3.Items.Count-1 do
         ListView3.Items[i].Checked := False;
     end;
end;

procedure TMain_Form.Button5Click(Sender: TObject);
var
    i,iPos,iCount,j,k,l: Integer;
begin

   Button3.Enabled :=False;
   Button4.Enabled :=False;
   Button6.Enabled :=False;
   Button7.Enabled :=False;
   Button8.Enabled :=False;
   Button9.Enabled :=False;
   Button10.Enabled :=False;
   Button11.Enabled :=False;
   Button5.Enabled :=False;
   Label4.Visible:= True;
   ProgressBar1.Visible:=True;
  l:=0;
  ProgressBar1.Min:=l;
  for i:=0 to ListView1.Items.Count-1 do
   begin
       if ListView1.Items.Item[i].Checked then
       begin
             CLK:=SetCLK(string(ListView1.Items.Item[i].SubItems[1]),string(ListView1.Items.Item[i].SubItems[2]),string(ListView1.Items.Item[i].SubItems[0]));

                        for  j:=0 to ListView3.Items.Count-1 do
                        begin
                            if ListView3.Items.Item[j].Checked then
                            begin
                                 if checkexist(ListView3.Items.Item[j].SubItems[2]) then
                                 begin
                                            if NewOpenPort(@CLK) then
                                            begin
                                                    if  EastRiver.DeleteAllowedCard(CLK.hPort,PChar(ListView3.Items.Item[j].SubItems[2])) then
                                            end;
                                            NewClosePort(@CLK);

                                            if dm.ADOConnection1.Connected then
                                            begin
                                                dm.ADOConnection1.BeginTrans;
                                                try
                                                  with dm.adotmp do
                                                  begin
                                                      Close;
                                                      sql.text := '';
                                                      sql.text := 'delete from employeecard_eastriver_'+leftstr(main_form.ComboBox1.Text,2)+' where cardno_dec = '+ListView3.Items.Item[j].SubItems[2];
                                                      ExecSQL;
                                                  end;
                                                  dm.ADOConnection1.CommitTrans;
                                                    l:= l + 1 ;
                                                    ProgressBar1.StepIt;
                                                  except
                                                     on E: Exception do
                                                     begin
                                                       dm.ADOConnection1.RollbackTrans;
                                                       messagedlg(E.Message,mterror,[mbcancel],0);
                                                     end;
                                                end;

                                            end;
                                 end;

                            end;
                        end;
                   end;
    l:=l+i;
    ProgressBar1.StepIt;
   end;
  l:= l + 1 ;
  ProgressBar1.StepIt;
  delayticks(10,true);//延时
  l:= l + 1 ;
  ProgressBar1.StepIt;
  for i:=0 to ListView1.Items.Count-1 do
  begin
       if ListView1.Items.Item[i].Checked then
       begin
             CLK:=SetCLK(string(ListView1.Items.Item[i].SubItems[1]),string(ListView1.Items.Item[i].SubItems[2]),string(ListView1.Items.Item[i].SubItems[0]));

                        for  j:=0 to ListView2.Items.Count-1 do
                        begin
                            if ListView2.Items.Item[j].Checked then
                            begin
                                 if not checkexist(ListView2.Items.Item[j].SubItems[2]) then
                                 begin

                                        if NewOpenPort(@CLK) then
                                            begin
                                                     EastRiver.SetAllowedCard(CLK.hPort,PChar(ListView2.Items.Item[j].SubItems[2]),PChar(ListView2.Items.Item[j].SubItems[0]),PChar(ListView2.Items.Item[j].SubItems[1]));
                                            end;
                                            NewClosePort(@CLK);

                                            if dm.ADOConnection1.Connected then
                                            begin
                                                dm.ADOConnection1.BeginTrans;
                                                try
                                                  with dm.adotmp do
                                                  begin
                                                      Close;
                                                      sql.text := '';
                                                      sql.text := 'insert into dbo.employeecard_eastriver_'+leftstr(main_form.ComboBox1.Text,2)+' (employeecode, cardno_dec, employeename, factorytype) values ('+ListView2.Items.Item[j].SubItems[0]+','+ListView2.Items.Item[j].SubItems[2]+','+#39+ListView2.Items.Item[j].SubItems[1]+#39+ ','+string(ListView2.Items.Item[j].SubItems[4])+') ';
                                                      ExecSQL;
                                                  end;
                                                  dm.ADOConnection1.CommitTrans;
                                                          l:= l + 1 ;
                                                          ProgressBar1.StepIt
                                                  except
                                                     on E: Exception do
                                                     begin
                                                       dm.ADOConnection1.RollbackTrans;
                                                       messagedlg(E.Message,mterror,[mbcancel],0);
                                                     end;
                                                end;

                                            end;
                                 end;
                            end;
                        end;
       end;
        l := l+i;
        ProgressBar1.StepIt;
  end;
   ProgressBar1.Max:=l;
   delayticks(10,true);//延时
   Button3.Enabled :=true;
   Button4.Enabled :=true;
   Button6.Enabled :=true;
   Button7.Enabled :=true;
   Button8.Enabled :=true;
   Button9.Enabled :=true;
   Button10.Enabled :=true;
   Button11.Enabled :=true;
   Button5.Enabled :=true;
   Label4.Visible:= False;
   ProgressBar1.Visible:=False;
end;

procedure TMain_Form.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  {  if Selected then
     begin
      CLK:=SetCLK(Item.SubItems[1],Item.SubItems[2],Item.SubItems[0]);

          if NewOpenPort(@clk) then
             StatusBar1.SimpleText := '连接成功....'
           else
            StatusBar1.SimpleText:='连接失败';
            NewClosePort(@clk);
     end;  }
end;

procedure TMain_Form.Button7Click(Sender: TObject);
begin
   ListView2.Clear;
end;

procedure TMain_Form.Button11Click(Sender: TObject);
begin
       ListView2.Clear;
end;

procedure TMain_Form.Button3Click(Sender: TObject);
var
  tmpst: string;
  i : Integer;
begin
          tmpst := dm.ADOADD1cardno_dec.Value ;
    if DM.ADOConnection1.Connected then
    begin
      if not DM.ADOADD1.IsEmpty then
      begin
          dm.ADOADD1.Close;
          dm.ADOADD1.Open;
          dm.ADOADD1.Locate('cardno_dec',tmpst,[]);
          if  ListView2.Items.Count <> 0 then
          begin
                for i:=0 to ListView2.Items.Count-1 do
                begin
                      if DM.ADOADD1.fieldbyname('cardno_dec').AsString = string(ListView2.Items.Item[i].SubItems[2]) then
                      begin
                            ShowMessage('您需要添加的名单已存在，无需重复添加。');
                            Abort;
                      end;
                end;

                ListView2.Items.Add;
                ListView2.items[ListView2.Items.Count-1].Caption:='';
                ListView2.Items[ListView2.Items.Count-1].Checked := True;
                ListView2.Items[ListView2.Items.Count-1].SubItems.Add(DM.ADOADD1.fieldbyname('employeecode').AsString);
                ListView2.Items[ListView2.Items.Count-1].SubItems.Add(DM.ADOADD1.fieldbyname('employeename').AsString);
                ListView2.Items[ListView2.Items.Count-1].SubItems.Add(DM.ADOADD1.fieldbyname('cardno_dec').AsString);
                ListView2.Items[ListView2.Items.Count-1].SubItems.Add(DM.ADOADD1.fieldbyname('factorytype1').AsString);
                ListView2.Items[ListView2.Items.Count-1].SubItems.Add(DM.ADOADD1.fieldbyname('factorytype').AsString);


          end else begin
                          ListView2.Items.Add;
                          ListView2.Items[0].Caption:='';
                          ListView2.Items[0].Checked := True;
                          ListView2.Items[0].SubItems.Add(DM.ADOADD1.fieldbyname('employeecode').AsString);
                          ListView2.Items[0].SubItems.Add(DM.ADOADD1.fieldbyname('employeename').AsString);
                          ListView2.Items[0].SubItems.Add(DM.ADOADD1.fieldbyname('cardno_dec').AsString);
                          ListView2.Items[0].SubItems.Add(DM.ADOADD1.fieldbyname('factorytype1').AsString);
                          ListView2.Items[0].SubItems.Add(DM.ADOADD1.fieldbyname('factorytype').AsString);
          end;
      end;
    end;
end;

procedure TMain_Form.Button8Click(Sender: TObject);
var
  tmpst: string;
  i : Integer;
begin
    if DM.ADOConnection1.Connected then
    begin
      if not DM.ADOREDU1.IsEmpty then
      begin
          tmpst := dm.ADOREDU1cardno_dec.Value ;
          dm.ADOREDU1.Close;
          dm.ADOREDU1.Open;
          dm.ADOREDU1.Locate('cardno_dec',tmpst,[]);
          if  ListView3.Items.Count <> 0 then
          begin
                for i:=0 to ListView3.Items.Count-1 do
                begin
                      if DM.ADOREDU1.fieldbyname('cardno_dec').AsString = string(ListView3.Items.Item[i].SubItems[2]) then
                      begin
                            ShowMessage('您需要添加的名单已存在，无需重复添加。');
                            Abort;
                      end;
                end;
                ListView3.Items.Add;
                ListView3.items[ListView3.Items.Count-1].Caption:='';
                ListView3.Items[ListView3.Items.Count-1].Checked := True;
                ListView3.Items[ListView3.Items.Count-1].SubItems.Add(DM.ADOREDU1.fieldbyname('employeecode').AsString);
                ListView3.Items[ListView3.Items.Count-1].SubItems.Add(DM.ADOREDU1.fieldbyname('employeename').AsString);
                ListView3.Items[ListView3.Items.Count-1].SubItems.Add(DM.ADOREDU1.fieldbyname('cardno_dec').AsString);
                ListView3.Items[ListView3.Items.Count-1].SubItems.Add(DM.ADOREDU1.fieldbyname('factorytype1').AsString);
                ListView3.Items[ListView3.Items.Count-1].SubItems.Add(DM.ADOREDU1.fieldbyname('factorytype').AsString);

          end else begin
                          ListView3.Items.Add;
                          ListView3.Items[0].Caption:='';
                          ListView3.Items[0].Checked := True;
                          ListView3.Items[0].SubItems.Add(DM.ADOREDU1.fieldbyname('employeecode').AsString);
                          ListView3.Items[0].SubItems.Add(DM.ADOREDU1.fieldbyname('employeename').AsString);
                          ListView3.Items[0].SubItems.Add(DM.ADOREDU1.fieldbyname('cardno_dec').AsString);
                          ListView3.Items[0].SubItems.Add(DM.ADOREDU1.fieldbyname('factorytype1').AsString);
                          ListView3.Items[0].SubItems.Add(DM.ADOREDU1.fieldbyname('factorytype').AsString);
          end;
      end;
    end;
end;

procedure TMain_Form.Button13Click(Sender: TObject);
var
     ListCardTotal,WhiteCard,BlackCard,i: Integer;
begin
    Memo2.Text:='';
    if ListView1.Items.Count = 0 then
     begin
         ShowMessage('没有设备列表，请先搜索设备');
         Abort;
     end else
     begin
            for i:=0 to ListView1.Items.Count-1 do
            begin
               if ListView1.Items.Item[i].Checked then
               begin
                    CLK:=SetCLK(string(ListView1.Items.Item[i].SubItems[1]),string(ListView1.Items.Item[i].SubItems[2]),string(ListView1.Items.Item[i].SubItems[0]));

                    if NewOpenPort(@CLK) then
                    begin
                        if eastriver.ReadListCardTotal(CLK.hPort,ListCardTotal,WhiteCard,BlackCard) then
                        begin
                            Memo2.Lines.Add( '考勤机'+string(ListView1.Items.Item[i].SubItems[0])+'号机白名单数量：'+Format('%d',[WhiteCard]));
                            Memo2.Lines.Add( '考勤机'+string(ListView1.Items.Item[i].SubItems[0])+'号机黑名单数量：'+Format('%d',[BlackCard]));
                            Memo2.Lines.Add( '考勤机'+string(ListView1.Items.Item[i].SubItems[0])+'号机名单总数量：'+Format('%d',[ListCardTotal]));
                        end;
                    end;
                    NewClosePort(@CLK);
                 end;
            end;
     end;
     Memo1.SelStart :=1;
end;

procedure TMain_Form.Button14Click(Sender: TObject);
var
  CLK:TClockInfo;
  i,icount,totalcount:integer;
  //FilePath:string;
  //fp:TextFile;
  //fp2:TextFile;
  //str:string;
begin
  if Edit1.Text = '' then
  begin
     ShowMessage('您尚未输入保存的路径，请输入');
     Self.BitBtn2Click(Sender);
  end
  else
  begin
  //数据采集20110428103058  28
  //0.txt                   15
        if Static_twicegather.Caption<>'0' then
        begin
        main_form.Edit1.Text:=copy(main_form.Edit1.Text,1,length(main_form.Edit1.Text)-5)+main_form.Static_twicegather.Caption+'.txt';
        end;      { 
      FilePath:=ExtractFilePath(Main_Form.Edit1.Text);
      FilePath:=Main_Form.Edit1.Text;
      try
        AssignFile(fp2, FilePath);
        if FileExists(FilePath) then
        begin
          Append(fp);
        end
        else
        begin
         rewrite(fp);
        end;}
      totalcount:=0;
      for i:=0 to ListView1.Items.Count-1 do
      begin
           if ListView1.Items.Item[i].Checked then
           begin
                 CLK:=SetCLK(string(ListView1.Items.Item[i].SubItems[1]),string(ListView1.Items.Item[i].SubItems[2]),string(ListView1.Items.Item[i].SubItems[0]));
                 CLK.CmdVerify:=true;
               if NewOpenPort(@CLK) then
               begin
                  icount:=eastriver.ReadAllRecord(clk.hPort, @clk, DataProgressProc, WaitProc);
                  totalcount := totalcount + icount;
                 //ReadAllRecordAsFile(clk.hPort,4,pchar('D:\刷卡数据采集\test.txt'),0,false,nil);
                  NewClosePort(@CLK);
               end;
            end;
      end;
      {
        if DM.ADOConnection1.Connected then
        begin
          try
             dm.ADOConnection1.BeginTrans;
              with DM.ADOTMP do
              begin
                      Close;
                      sql.Text:= '';
                      sql.Text:='exec update_card_list_'+leftstr(main_form.ComboBox1.Text,2);
                      ExecSQL;
              end;
               dm.ADOConnection1.CommitTrans;
             except
               on E: Exception do
               begin
                 dm.ADOConnection1.RollbackTrans;
                 messagedlg(E.Message,mterror,[mbcancel],0);
               end;
            end;
        end;
      if not DirectoryExists(Edit1.Text) then
      begin
         CreateDirectory(PChar(ExtractFilePath(Edit1.Text)),nil);
      end;
      FilePath:=ExtractFilePath(Edit1.Text+'数据采集'+FormatDateTime('yyyyMMddHHmmSS',now)+'.txt');
      FilePath:=Edit1.Text;
      try
          AssignFile(fp, FilePath);
          if FileExists(FilePath) then
          begin
            Append(fp);
          end
          else
          begin
            rewrite(fp);
          end;
        if DM.ADOConnection1.Connected then
        begin
          try
              with DM.ADORCD1 do
              begin
                    Close;
                    SQL.Text :='';
                    SQL.Text := ' SELECT     id, empno, employeecard, card_time, date_e, time_e, dev_id, dev_mark, empid, remark1, remark2, remark3, factorytype,'+#13+
                                'CASE factorytype when 01 then '+#39+'深圳五株'+#39+' when 02 then '+#39+'梅州志浩'+#39+' end as factorytype1'+#13+
                                ' FROM   employeecard_eastriver_rcd_'+leftstr(main_form.ComboBox1.Text,2)+#13;
                    ExecSQL;
                    Open;
                    if not IsEmpty then
                    begin
                        First;
                        while  not Eof do
                        begin
                            str:=fieldbyname('empno').AsString+#9+
                                  fieldbyname('card_time').AsString+#9+
                                  Trim(fieldbyname('dev_id').AsString)+#9+
                                  fieldbyname('remark1').AsString+#9+
                                  fieldbyname('empno').AsString+#9+
                                  fieldbyname('remark2').AsString+#9+
                                  inttostr(0);
                            writeln(fp, str);
                            Next;
                        end;
                    end;
              end;
              DM.ADORCD1.First;
          except
               on E: Exception do
               begin
                 dm.ADOConnection1.RollbackTrans;
                 messagedlg(E.Message,mterror,[mbcancel],0);
               end;
          end;
                if DM.ADOConnection1.Connected then
                begin
                  try
                     dm.ADOConnection1.BeginTrans;
                      with DM.ADOTMP do
                      begin
                              Close;
                              sql.Text:= '';
                              sql.Text:='delete from employeecard_eastriver_rcd_'+QuotedStr(main_form.ComboBox1.Text);
                              ExecSQL;
                      end;
                       dm.ADOConnection1.CommitTrans;
                     except
                       on E: Exception do
                       begin
                         dm.ADOConnection1.RollbackTrans;
                         messagedlg(E.Message,mterror,[mbcancel],0);
                       end;
                    end;
                end;

        end;
      finally
      CloseFile(fp);
      end;    }
    end;

    ShowMessage('成功采集数据'+IntToStr(icount)+'条。');
    filelistbox1.FileName:=pchar(Main_Form.Edit1.Text); //打开TXT文本
     with filelistbox1 do
    ExecuteFile(FileName, '', Directory, SW_SHOW) ;
    Self.Button18Click(Sender);
    main_form.Static_twicegather.Caption:=inttostr(strtoint(main_form.Static_twicegather.Caption)+1);
end;

procedure TMain_Form.Button15Click(Sender: TObject);
var
    v_message:Integer;
begin
    v_message:=messagedlg('是否清空数据库数据?',mtConfirmation,[mbyes,mbno],0);
    if v_message=6 then
    begin
        if DM.ADOConnection1.Connected then
        begin
          try
             dm.ADOConnection1.BeginTrans;
              with DM.ADOTMP do
              begin
                      Close;
                      sql.Text:= '';
                      sql.Text:='delete from employeecard_eastriver_rcd_'+leftstr(main_form.ComboBox1.Text,2);
                      ExecSQL;
              end;
               dm.ADOConnection1.CommitTrans;
             except
               on E: Exception do
               begin
                 dm.ADOConnection1.RollbackTrans;
                 messagedlg(E.Message,mterror,[mbcancel],0);
               end;
            end;
        end;
    end;
    DM.ADORCD1.Close;
    DM.ADORCD1.Open;
end;

procedure TMain_Form.Button16Click(Sender: TObject);
var
  i,iPos,iCount,j:integer;
  ListCards: NameListArray;
  li:TListItem;
begin
  //iCount:=1;
  ListView4.Clear;
  for i:=0 to ListView1.Items.Count-1 do
  begin
    iCount:=1;
       if ListView1.Items.Item[i].Checked then
       begin
             CLK:=SetCLK(string(ListView1.Items.Item[i].SubItems[1]),string(ListView1.Items.Item[i].SubItems[2]),string(ListView1.Items.Item[i].SubItems[0]));

               if NewOpenPort(@CLK) then
               begin
                  iPos:=0;
                  fillChar(ListCards,sizeof(ListCards),0);
                  while iCount>0 do
                  begin
                    iCount:=8;
                    if eastriver.ReadDeviceListCard(CLK.hPort,iPos,iCount,ListCards) then
                    begin
                      for j:=0 to iCount-1 do
                      begin
                          if  ListCards[j].listtype = 1 then
                          begin
                              li:= ListView4.Items.Add;
                              li.Caption := ListCards[j].emp_no;
                              li.SubItems.Add(ListCards[j].emp_name);
                              li.SubItems.Add(ListCards[j].cardno);
                              li.SubItems.Add(string(ListView1.Items.Item[i].SubItems[0]));
                          end;
                      end;
                    end;
                    iPos:=iPos+8;
                  end;
               end;
               NewClosePort(@CLK);
       end;
  end;
if Messagedlg('是否以此设备名单列表同步系统的名单映射表?'+#13+'以前添加失败的名单将重新显示在名单待增栏。',mtWarning,[mbYES,mbNO],0)=6 then
  begin
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text:='create table #temp_emplist'+leftstr(main_form.ComboBox1.Text,2)+'(empno nvarchar(20),chinesename nvarchar(20),cardno nvarchar(20))';
  dm.ADOTMP.ExecSQL;
  for i:=0 to listview4.Items.Count-1  do
  begin
  //li:=listview5.Items.Add;
  //li.Caption:=listview4.Items[i].Caption;           //读第i行第1列
  //li.SubItems.add(listview4.Items[i].SubItems.strings[0]); //读第i行第2列
  //li.SubItems.Add(listview4.Items[i].SubItems.strings[1]); //读第i行第3列
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text:='insert into #temp_emplist'+leftstr(main_form.ComboBox1.Text,2)+
  ' select '+quotedstr(trim(listview4.Items[i].Caption))+
  ' , '+#39+midstr(listview4.Items[i].SubItems.strings[0],1,4)+#39+
  ' , '+quotedstr(listview4.Items[i].SubItems.strings[1]);
  dm.ADOTMP.ExecSQL;
  end;
  dm.ADOTMP.SQL.Clear;
  dm.ADOTMP.SQL.Text:='delete from dbo.employeecard_eastriver_'+leftstr(main_form.ComboBox1.Text,2)+
  ' where cardno_dec not in (select cardno from #temp_emplist'+leftstr(main_form.ComboBox1.Text,2)+')'+#13+
  ' drop table #temp_emplist'+leftstr(main_form.ComboBox1.Text,2);
  dm.ADOTMP.ExecSQL;
  dm.ADOTMP.SQL.Clear;
  showmessage('映像表同步完成，请进入'+#39+'增减名单'+#39+'对该机器进行名单操作');
  end;










end;

function CustomSortProc(Item1, Item2: TListItem; ColumnIndex: integer): integer; stdcall;
begin
if  ColumnIndex = 0 then
Result := CompareText(Item1.Caption,Item2.Caption)
else
Result := CompareText(Item1.SubItems[ColumnIndex-1],Item2.SubItems[ColumnIndex-1])
end;

procedure TMain_Form.ListView4ColumnClick(Sender: TObject;
  Column: TListColumn);
begin
listview4.CustomSort(@customsortproc,column.Index);
//showmessage(listview4.Column.Index);
//showmessage('开始排序');
end;



procedure TMain_Form.Button17Click(Sender: TObject);
var
  i,iPos,iCount,j:integer;
  ListCards: NameListArray;
  li:TListItem;
begin
  iCount:=1;
  ListView5.Clear;
  for i:=0 to ListView1.Items.Count-1 do
  begin
    iCount:=1;
       if ListView1.Items.Item[i].Checked then
       begin
             CLK:=SetCLK(string(ListView1.Items.Item[i].SubItems[1]),string(ListView1.Items.Item[i].SubItems[2]),string(ListView1.Items.Item[i].SubItems[0]));
               if NewOpenPort(@CLK) then
               begin
                  iPos:=0;
                  fillChar(ListCards,sizeof(ListCards),0);
                  while iCount>0 do
                  begin
                    iCount:=8;
                    if eastriver.ReadDeviceListCard(CLK.hPort, iPos,iCount,ListCards) then
                    begin
                      for j:=0 to iCount do
                      begin
                          if  ListCards[j].listtype = 0 then
                          begin
                            li:= ListView5.Items.Add;
                            li.Caption := ListCards[j].emp_no;
                            li.SubItems.Add(ListCards[j].emp_name);
                            li.SubItems.Add(ListCards[j].cardno);
                             li.SubItems.Add(string(ListView1.Items.Item[i].SubItems[0]));
                          end;
                      end;
                    end;
                    iPos:=iPos+8;
                  end;
                  NewClosePort(@CLK);
               end;
       end;
  end;
end;

procedure TMain_Form.Button6Click(Sender: TObject);
begin
        ListView2.Selected.Delete;
end;

procedure TMain_Form.Button10Click(Sender: TObject);
begin
       ListView3.Selected.Delete;
end;

procedure TMain_Form.Button18Click(Sender: TObject);
var
    i,v_message:Integer;
begin
    v_message:=messagedlg('是否清空考勤机上的刷卡记录?',mtConfirmation,[mbyes,mbno],0);
    if v_message=6 then
    begin
          for i:=0 to ListView1.Items.Count-1 do
          begin
               if ListView1.Items.Item[i].Checked then
               begin
                    CLK:=SetCLK(string(ListView1.Items.Item[i].SubItems[1]),string(ListView1.Items.Item[i].SubItems[2]),string(ListView1.Items.Item[i].SubItems[0]));

                       if NewOpenPort(@CLK) then
                       begin
                          if eastriver.ClearAllReadCard(CLK.hPort) then
                          begin
                             ShowMessage('清除成功');
                          end;
                          NewClosePort(@CLK);
                       end;
               end;
          end;
    end;
end;


procedure TMain_Form.BitBtn2Click(Sender: TObject);
var
  s :string;
begin

    savedialog1.FileName:='数据采集'+FormatDateTime('yyyyMMddHHmmSS',now)+main_form.Static_twicegather.Caption+'.txt';
    savedialog1.Execute;
    Edit1.Text := SaveDialog1.FileName;
end;


procedure TMain_Form.FormCreate(Sender: TObject);
var
    inifile:Tinifile;
    FileDir:string;
    SListString:TStrings;
    i:Integer;
    li:TListItem;
begin
      FileDir:=ExtractFilePath(Paramstr(0))+'HRPR.ini';
      SListString := TStringList.Create;
      inifile:=Tinifile.create(FileDir);//打开D盘的 1.ini 文件。
      inifile.ReadSections(SListString);
     for i := 1 to SListString.Count do
      begin
            li:= ListView1.Items.Add;
            li.Caption := '';
            li.SubItems.Add(inifile.ReadString(IntToStr(i),'DevID',''));
            li.SubItems.Add(inifile.ReadString(IntToStr(i),'DevIP',''));
            li.SubItems.Add(inifile.ReadString(IntToStr(i),'IPPort',''));
            li.SubItems.Add(inifile.ReadString(IntToStr(i),'APP',''));
            li.SubItems.Add(inifile.ReadString(IntToStr(i),'Mode',''));
      end;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0];
  DBGridEh1.Columns[0].Title.Color := clred ;
  field_name2 := DBGridEh2.Columns[0].FieldName;
  PreColumn2 := DBGridEh2.Columns[0];
  DBGridEh2.Columns[0].Title.Color := clred ;
  field_name3 := DBGridEh2.Columns[0].FieldName;
  PreColumn3 := DBGridEh2.Columns[0];
  DBGridEh3.Columns[0].Title.Color := clred ;
   case combobox1.ItemIndex of
   0:   main_form.Caption:='餐饮卡钟程序-深圳五洲2.2_201105';
   1:   main_form.Caption:='餐饮卡钟程序-梅州一厂2.2_201109';
   2:   main_form.Caption:='餐饮卡钟程序-梅州二厂2.2_201109';
   3:   main_form.Caption:='餐饮卡钟程序-东莞五洲2.2_201105';
   4:   main_form.Caption:='餐饮卡钟程序-东莞威力固2.2_201105';
   5:   main_form.Caption:='餐饮卡钟程序-东莞浩远电子2.2_201105';
   end;
   //radiogroup_typechoose.Items.Add()
end;

procedure TMain_Form.Button19Click(Sender: TObject);
begin
    DM.ADORCD1.Close;
    DM.ADORCD1.Open;
end;

procedure TMain_Form.BitBtn3Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TMain_Form.DBGridEh1TitleClick(Column: TColumnEh);
begin
      if  DBGridEh1.DataSource.DataSet.Active then
      begin
      if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
      begin
         column.Title.SortMarker:=smUpEh;
         dm.ADOADD1.Sort:=Column.FieldName;
      end
      else
      begin
         column.Title.SortMarker:=smDownEh;
          dm.ADOADD1.Sort:=Column.FieldName+' DESC';
      end;
      if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
          begin
              self.field_name:=column.FieldName;
              PreColumn.Title.Color := clBtnFace;
              Column.Title.Color := clred;
              PreColumn := column;
          end;
        end;
end;

procedure TMain_Form.DBGridEh2TitleClick(Column: TColumnEh);
begin
      if  DBGridEh2.DataSource.DataSet.Active then
      begin
      if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
      begin
         column.Title.SortMarker:=smUpEh;
         dm.ADOREDU1.Sort:=Column.FieldName;
      end
      else
      begin
         column.Title.SortMarker:=smDownEh;
          dm.ADOREDU1.Sort:=Column.FieldName+' DESC';
      end;
      if (PreColumn2.FieldName<>column.FieldName) and (column.ReadOnly) then
          begin
              self.field_name2:=column.FieldName;
              PreColumn2.Title.Color := clBtnFace;
              Column.Title.Color := clred;
              PreColumn2 := column;
          end;
      end;
end;

procedure TMain_Form.DBGridEh3TitleClick(Column: TColumnEh);
begin
      if  DBGridEh3.DataSource.DataSet.Active then
      begin
      if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
      begin
         column.Title.SortMarker:=smUpEh;
         dm.ADORCD1.Sort:=Column.FieldName;
      end
      else
      begin
         column.Title.SortMarker:=smDownEh;
          dm.ADORCD1.Sort:=Column.FieldName+' DESC';
      end;
      if (PreColumn3.FieldName<>column.FieldName) and (column.ReadOnly) then
          begin
              self.field_name3:=column.FieldName;
              PreColumn3.Title.Color := clBtnFace;
              Column.Title.Color := clred;
              PreColumn3 := column;
          end;
      end;
end;
procedure TMain_Form.Button_cjClick(Sender: TObject);
var
myfile1:TMemoryStream;
myfile2:Textfile;
i,j,k,cs,cl,ds,dl,ts,tl,dvs,dvl:integer;
Filebuf: array of array of  string;
addchar,s:string;
FileList:TStringList;
begin
k:=0;
opendialog_loadtxt.Execute;
try
assignfile(myfile2,opendialog_loadtxt.FileName);
    FileList:=TStringList.Create;
    FileList.LoadFromFile(opendialog_loadtxt.FileName);
    k:=FileList.Count;
    setlength(Filebuf,k,4);//设置数组下标个数
    filelist.Clear;
reset(myfile2);
richedit1.Text:='';
i:=0;
j:=0;
self.StringGrid1.RowCount:=k+1;
self.StringGrid1.ColCount:=5;
self.StringGrid1.ColWidths[0]:=30;
self.StringGrid1.ColWidths[1]:=100;
self.StringGrid1.ColWidths[2]:=100;
self.StringGrid1.ColWidths[3]:=100;
self.StringGrid1.ColWidths[4]:=100;
self.StringGrid1.Cells[0,0]:='序号';
self.StringGrid1.Cells[1,0]:= '卡号'+'('+edit_cs.Text+','+edit_cl.Text+')';
self.StringGrid1.Cells[2,0]:= '日期'+'('+edit_ds.Text+','+edit_dl.Text+')';
self.StringGrid1.Cells[3,0]:= '时间'+'('+edit_ts.Text+','+edit_tl.Text+')';
self.StringGrid1.Cells[4,0]:= '机器号'+'('+edit_dvs.Text+','+edit_dvl.Text+')';
cs:=strtoint(edit_cs.Text);
cl:=strtoint(edit_cl.Text);
ds:=strtoint(edit_ds.Text);
dl:=strtoint(edit_dl.Text);
ts:=strtoint(edit_ts.Text);
tl:=strtoint(edit_tl.Text);
dvs:=strtoint(edit_dvs.Text);
dvl:=strtoint(edit_dvl.Text);
while not eof(myfile2) do
begin
 readln(myfile2,s);
         richedit1.Text:=richedit1.Text+S+#13;
         Filebuf[i,0]:=midstr(s,cs,cl);   //卡号
         Filebuf[i,1]:=midstr(s,ds,dl);  //日期
         case dl of
         8: Filebuf[i,1]:=midstr(Filebuf[i,1],1,4)+'-'+midstr(Filebuf[i,1],5,2)+'-'+midstr(Filebuf[i,1],7,2);
         end;
         Filebuf[i,2]:=midstr(s,ts,tl);   //时间
         case tl of
         6: Filebuf[i,2]:=midstr(Filebuf[i,2],1,2)+':'+midstr(Filebuf[i,2],3,2)+':'+midstr(Filebuf[i,2],5,2);
         end;
         Filebuf[i,3]:=midstr(s,dvs,dvl);   //机号
         j:=i+1;
         self.StringGrid1.Cells[1,j]:= Filebuf[i,0];
         self.StringGrid1.Cells[2,j]:= Filebuf[i,1];
         self.StringGrid1.Cells[3,j]:= Filebuf[i,2];
         self.StringGrid1.Cells[4,j]:= Filebuf[i,3];
         i:=i+1;
         self.StringGrid1.Cells[0,j]:= inttostr(i);
         if k>=2 then
         progressbar_importdata.Position:=Trunc(i/(k-1)*100);
end;
 closefile(myfile2);
 button_dr.Enabled:=true;
 button_cz.Enabled:=true;
 progressbar_importdata.Position:=0; 
 except
 showmessage('文件载入失败');
 end;
end;

procedure TMain_Form.Radio_mrClick(Sender: TObject);
begin
edit_cs.Text:='24';
edit_cl.Text:='10';
edit_ds.Text:='5';
edit_dl.Text:='8';
edit_ts.Text:='13';
edit_tl.Text:='6';
edit_dvs.Text:='1';
edit_dvl.Text:='1';
BitBtn4.Enabled:=false;

end;

procedure TMain_Form.Radio_yslClick(Sender: TObject);
begin
edit_cs.Text:='19';
edit_cl.Text:='10';
edit_ds.Text:='4';
edit_dl.Text:='8';
edit_ts.Text:='12';
edit_tl.Text:='6';
edit_dvs.Text:='1';
edit_dvl.Text:='2';
BitBtn4.Enabled:=false;
end;



procedure TMain_Form.Edit_csKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;

procedure TMain_Form.Edit_clKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;

procedure TMain_Form.Edit_dsKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;

procedure TMain_Form.Edit_dlKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;

procedure TMain_Form.Edit_tsKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;

procedure TMain_Form.Edit_tlKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;

procedure TMain_Form.Edit_dvsKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;

procedure TMain_Form.Edit_dvlKeyPress(Sender: TObject; var Key: Char);
begin
 if not (key in ['0'..'9',#8,#13]) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;

procedure TMain_Form.Action1Execute(Sender: TObject);
begin
if main_form.PageControl1.TabIndex=6 then
begin
showmessage('开始修改设置');
combobox1.Visible:=true;
label9.Visible:=true;
combobox1.Enabled:=true;
end;
end;

procedure TMain_Form.Button_drClick(Sender: TObject);
var
i,j,k:integer;
c1,c2,c3,c4:string;
threadid1:dword;
begin
i:=0;
j:=0;
k:=0;
k:=self.StringGrid1.RowCount; //加表头为x+1
if k<=1 then
begin
showmessage('无数据');
end;

if k>=2 then
begin
showmessage('待导入数据有'+inttostr(k-1)+'条');//k=0那一行不算
//adoconnection1.Connected:=true;
//adoconnection1.Open;
for  i:=1 to  k-1 do
begin
c1:=self.StringGrid1.Cells[1,i];
c2:=self.StringGrid1.Cells[2,i];
c3:=self.StringGrid1.Cells[3,i];
c4:=self.StringGrid1.Cells[4,i];
dm.ADOGETDATA.Close;
dm.ADOGETDATA.SQL.Clear;
dm.ADOGETDATA.SQL.Add('insert into employeecard_eastriver_rcd_'+leftstr(main_form.ComboBox1.Text,2)+
'(employeecard,date_e,time_e,dev_id) '+
'values('+
quotedstr(c1)+','+
quotedstr(c2)+','+
quotedstr(c3)+','+
quotedstr(c4)+')');
{date_e
time_e
dev_id
employeecard}
dm.ADOGETDATA.ExecSQL;
dm.ADOGETDATA.Close;
ProgressBar_importdata.Position:=Trunc(i/(k-1)*100);
statictext_procbar.Caption:='开始导入原始数据'+inttostr(i)+'/'+inttostr(k-1)+'请勿作其他操作';
//开始做数据转移到总表
//开始卡匹配
//匹配完的数据插入佳文系统
end;
//adoconnection1.Close;
//adoconnection1.Connected:=false;
ProgressBar_importdata.Position:=0;
dm.ADOGETDATA.SQL.Clear;
dm.ADOGETDATA.SQL.Text:='update employeecard_eastriver_rcd_'+leftstr(main_form.ComboBox1.Text,2)+
'  set card_time=date_e+'+#39+' '+#39+'+time_e,'+
' remark3=replace(replace(date_e+time_e,'+#39+':'+#39+','+#39+#39+'),'+#39+'-'+#39+','+#39+#39+') '+
'  from  employeecard_eastriver_rcd_'+leftstr(main_form.ComboBox1.Text,2)+
' where card_time is null and date_e is not null ';
dm.ADOGETDATA.ExecSQL;
dm.ADOGETDATA.SQL.Clear;
button_dr.Enabled:=false;
button_cj.Enabled:=false;
statictext_procbar.Caption:='如匹配时间太长，可将程序挂起,请等待';
ProgressBar_importdata.Position:=50;
//try
dataimport_thread.TMyThread.Create(false);
dataimport_show.dataimport_showbar.Create(false);
//thread_1.Create(false);
//except
//showmessage('导入失败');
//end;
//createthread(nil,0,@tmain_form.dataimportwait,nil,0,threadid1);

//清空 employeecard_eastriver_rcd_工厂号
Button15.Enabled:=true;
end;
end;
//----线程

procedure tmain_form.dataimportwait;
begin
dm.ADOGETDATA.SQL.Clear;
dm.ADOGETDATA.SQL.Text:='exec update_card_list_'+leftstr(main_form.ComboBox1.Text,2);
dm.ADOGETDATA.ExecSQL;
//statictext_procbar.Caption:='已完成';
//showmessage('导入成功'+inttostr(k-1));
//button_dr.Enabled:=true;
end;
//====
procedure TMain_Form.ComboBox1Change(Sender: TObject);
begin
//将选择写入INI ，尚未写
combobox1.Enabled:=false;
case combobox1.ItemIndex of
   0:   main_form.Caption:='餐饮卡钟程序-深圳五洲2.2_201105';
   1:   main_form.Caption:='餐饮卡钟程序-梅州一厂2.2_201105';
   2:   main_form.Caption:='餐饮卡钟程序-梅州二厂2.2_201105';
   3:   main_form.Caption:='餐饮卡钟程序-东莞五洲2.2_201105';
   4:   main_form.Caption:='餐饮卡钟程序-东莞威力固2.2_201105';
   5:   main_form.Caption:='餐饮卡钟程序-东莞浩远2.2_201105';
   end;
end;

procedure TMain_Form.Button_czClick(Sender: TObject);
 var
myfile2:Textfile;
i,j,k,cs,cl,ds,dl,ts,tl,dvs,dvl:integer;
Filebuf: array of array of  string;
addchar,s:string;
FileList:TStringList;
begin
 k:=0;
assignfile(myfile2,opendialog_loadtxt.FileName);
    FileList:=TStringList.Create;
    FileList.LoadFromFile(opendialog_loadtxt.FileName);
    k:=FileList.Count;
    setlength(Filebuf,k,4);//设置数组下标个数
    filelist.Clear;
reset(myfile2);
richedit1.Text:='';
i:=0;
j:=0;
self.StringGrid1.RowCount:=k+1;
self.StringGrid1.ColCount:=5;
self.StringGrid1.ColWidths[0]:=30;
self.StringGrid1.ColWidths[1]:=100;
self.StringGrid1.ColWidths[2]:=100;
self.StringGrid1.ColWidths[3]:=100;
self.StringGrid1.ColWidths[4]:=100;
self.StringGrid1.Cells[0,0]:='序号';
self.StringGrid1.Cells[1,0]:= '卡号'+'('+edit_cs.Text+','+edit_cl.Text+')';
self.StringGrid1.Cells[2,0]:= '日期'+'('+edit_ds.Text+','+edit_dl.Text+')';
self.StringGrid1.Cells[3,0]:= '时间'+'('+edit_ts.Text+','+edit_tl.Text+')';
self.StringGrid1.Cells[4,0]:= '机器号'+'('+edit_dvs.Text+','+edit_dvl.Text+')';
cs:=strtoint(edit_cs.Text);
cl:=strtoint(edit_cl.Text);
ds:=strtoint(edit_ds.Text);
dl:=strtoint(edit_dl.Text);
ts:=strtoint(edit_ts.Text);
tl:=strtoint(edit_tl.Text);
dvs:=strtoint(edit_dvs.Text);
dvl:=strtoint(edit_dvl.Text);
while not eof(myfile2) do
begin
 readln(myfile2,s);
 richedit1.Text:=richedit1.Text+S+#13;
 Filebuf[i,0]:=midstr(s,cs,cl);   //卡号

 Filebuf[i,1]:=midstr(s,ds,dl);  //日期
 case dl of
 8: Filebuf[i,1]:=midstr(Filebuf[i,1],1,4)+'-'+midstr(Filebuf[i,1],5,2)+'-'+midstr(Filebuf[i,1],7,2);
 end;
 Filebuf[i,2]:=midstr(s,ts,tl);   //时间
 case tl of
 6: Filebuf[i,2]:=midstr(Filebuf[i,2],1,2)+':'+midstr(Filebuf[i,2],3,2)+':'+midstr(Filebuf[i,2],5,2);
 end;
 Filebuf[i,3]:=midstr(s,dvs,dvl);   //机号
j:=i+1;
 self.StringGrid1.Cells[1,j]:= Filebuf[i,0];
 self.StringGrid1.Cells[2,j]:= Filebuf[i,1];
 self.StringGrid1.Cells[3,j]:= Filebuf[i,2];
 self.StringGrid1.Cells[4,j]:= Filebuf[i,3];
  i:=i+1;
 self.StringGrid1.Cells[0,j]:= inttostr(i);
end;
 closefile(myfile2);
 bitbtn1.Enabled:=true;
end;






procedure TMain_Form.Radio_zdyClick(Sender: TObject);
var
myinifile:Tinifile;
filepath:string;

begin
 filepath:=ExtractFilePath(Paramstr(0))+'HRCONFIG.ini';
 myinifile:=tinifile.Create(filepath);
 edit_cs.Text:=myinifile.ReadString('1','edit_cs','0');
 edit_cl.Text:=myinifile.ReadString('1','edit_cl','0');
 edit_ds.Text:=myinifile.ReadString('1','edit_ds','0');
 edit_dl.Text:=myinifile.ReadString('1','edit_dl','0');
 edit_ts.Text:=myinifile.ReadString('1','edit_ts','0');
 edit_tl.Text:=myinifile.ReadString('1','edit_tl','0');
 edit_dvs.Text:=myinifile.ReadString('1','edit_dvs','0');
 edit_dvl.Text:=myinifile.ReadString('1','edit_dvl','0');
 BitBtn4.Enabled:=true;
 myinifile.Destroy;
end;
{
      FileDir:=ExtractFilePath(Paramstr(0))+'HRPR.ini';
      SListString := TStringList.Create;
      inifile:=Tinifile.create(FileDir);//打开D盘的 1.ini 文件。}
procedure TMain_Form.BitBtn4Click(Sender: TObject);
var
myinifile:Tinifile;
filepath:string;
begin
filepath:=ExtractFilePath(Paramstr(0))+'HRCONFIG.ini';
 myinifile:=tinifile.Create(filepath);
 myinifile.WriteString('1','edit_cs',edit_cs.Text);
 myinifile.WriteString('1','edit_cl',edit_cl.Text);
 myinifile.WriteString('1','edit_ds',edit_ds.Text);
 myinifile.WriteString('1','edit_dl',edit_dl.Text);
 myinifile.WriteString('1','edit_ts',edit_ts.Text);
 myinifile.WriteString('1','edit_tl',edit_tl.Text);
 myinifile.WriteString('1','edit_dvs',edit_dvs.Text);
 myinifile.WriteString('1','edit_dvl',edit_dvl.Text);
 myinifile.Destroy;
 showmessage('保存成功');
 BitBtn4.Enabled:=false;
end;

procedure TMain_Form.Action2Execute(Sender: TObject);
begin

if main_form.PageControl1.TabIndex=6 then
begin
showmessage('开始修改就餐时间设置');
edit_t1.Enabled:=true;
edit_t2.Enabled:=true;
edit_t3.Enabled:=true;
edit_t4.Enabled:=true;
edit_t5.Enabled:=true;
edit_t6.Enabled:=true;
edit_t7.Enabled:=true;
edit_t8.Enabled:=true;
Button_bbjcpz.Enabled:=true;
end;
end;

procedure TMain_Form.Button_bbjcpzClick(Sender: TObject);
var
myinifile:Tinifile;
filepath:string;
begin
filepath:=ExtractFilePath(Paramstr(0))+'HRCONFIG.ini';
 myinifile:=tinifile.Create(filepath);
 myinifile.WriteString('3','t1',edit_t1.Text);
 myinifile.WriteString('3','t2',edit_t2.Text);
 myinifile.WriteString('3','t3',edit_t3.Text);
 myinifile.WriteString('3','t4',edit_t4.Text);
 myinifile.WriteString('3','t5',edit_t5.Text);
 myinifile.WriteString('3','t6',edit_t6.Text);
 myinifile.WriteString('3','t7',edit_t7.Text);
 myinifile.WriteString('3','t8',edit_t8.Text);
 myinifile.Destroy;
 showmessage('保存成功');
 Button_bbjcpz.Enabled:=false;
 edit_t1.Enabled:=false;
 edit_t2.Enabled:=false;
 edit_t3.Enabled:=false;
 edit_t4.Enabled:=false;
 edit_t5.Enabled:=false;
 edit_t6.Enabled:=false;
 edit_t7.Enabled:=false;
 edit_t8.Enabled:=false;
 button_gxcxb.Enabled:=true;
end;

procedure TMain_Form.DateTimePicker1CloseUp(Sender: TObject);
begin
if DateTimePicker2.Date<DateTimePicker1.Date
then
begin
DateTimePicker1.Date:=DateTimePicker2.Date;
showmessage('开始日期不能大于结束日期');
exit;
end;
end;

procedure TMain_Form.DateTimePicker2CloseUp(Sender: TObject);
begin
if DateTimePicker2.Date<DateTimePicker1.Date
then
begin
DateTimePicker2.Date:=DateTimePicker1.Date;
showmessage('结束日期不能小于开始日期');
exit;
end;
end;

procedure TMain_Form.Button_dcjgClick(Sender: TObject);
begin
export_dbgrideh_to_excel(DBGridEh4,self.Caption) ;
end;

procedure TMain_Form.Button_cxClick(Sender: TObject);
var
dept_str:string;
flag_mealtype:string;
begin
button_cx.Enabled:=false;
dbgrideh4.OnTitleClick:=DBGridEh4TitleClick;
case combobox_deplist.ItemIndex of
  0: dept_str := '';
  1..100: dept_str := ' and  departmentname ='+quotedstr(combobox_deplist.Text);
else
  dept_str := '';
end;
//----此处添加员工餐的查询条件
if checkbox_ygc.Checked=true  then
begin
dept_str:=dept_str+' and meal_type=1';
flag_mealtype:='1';
end
else
begin
dept_str:=dept_str+' and meal_type=2' ;
flag_mealtype:='2';
end;


if   radiobutton_ygcx.Checked then   //员工查询，员工工号未输入
begin
if edit_cxgh.text=''then
begin
DM.ADODataSet_cx.Active:=false;
dm.DataSource_cx.DataSet:=dm.ADODataSet_cx;
dm.ADODataSet_cx.CommandText:='select departmentname as 部门,empid as 工号,empname as 姓名,sum(breakfast) as 早餐,'+
'sum(lunch) as 午餐 ,sum(supper)as 晚餐,sum([night snack]) as 宵夜,sum(invalid_card) as 无效卡  from dbo.View_canci_'+leftstr(main_form.ComboBox1.Text,2)+
 ' where meal_date >='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)) +
 ' and  meal_date <='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date)) +dept_str+
 ' group by departmentname,empname,empid'+
 ' order by departmentname,empname';
end;
if edit_cxgh.text<>''then       //员工查询，员工工号输入
begin
DM.ADODataSet_cx.Active:=false;
dm.DataSource_cx.DataSet:=dm.ADODataSet_cx;
dm.ADODataSet_cx.CommandText:='select departmentname as 部门,empid as 工号,empname as 姓名,sum(breakfast) as 早餐,'+
'sum(lunch) as 午餐 ,sum(supper)as 晚餐,sum([night snack]) as 宵夜,sum(invalid_card) as 无效卡  from dbo.View_canci_'+leftstr(main_form.ComboBox1.Text,2)+
 ' where meal_date >='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)) +
 ' and  meal_date <='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date)) +
 ' and  empid like '+quotedstr(edit_cxgh.Text+'%')+dept_str+
 ' group by departmentname,empname,empid'+
 ' order by departmentname,empname';
end;
dm.ADODataSet_cx.Active:=true;
DBGridEh4.Columns.RebuildColumns;
dbgrideh4.Columns.Items[0].Width:=100;
dbgrideh4.Columns.Items[1].Width:=50;
dbgrideh4.Columns.Items[2].Width:=50;
dbgrideh4.Columns.Items[3].Width:=50;
dbgrideh4.Columns.Items[4].Width:=50;
dbgrideh4.Columns.Items[5].Width:=50;
dbgrideh4.Columns.Items[6].Width:=50;
dbgrideh4.Columns.Items[7].Width:=50;
end;
 if   RadioButton_bmcx.Checked then
begin
dbgrideh4.PopupMenu:=nil;
DM.ADODataSet_cx.Active:=false;
dm.DataSource_cx.DataSet:=dm.ADODataSet_cx;
dm.ADODataSet_cx.CommandText:='select departmentname as 部门,count(empname) as 就餐人数,sum(breakfast) as 早餐,'+
'sum(lunch) as 午餐 ,sum(supper)as 晚餐,sum([night snack]) as 宵夜,sum(invalid_card) as 无效卡  from dbo.View_canci_'+leftstr(main_form.ComboBox1.Text,2)+
 ' where meal_date >='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)) +
 ' and  meal_date <='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date)) +dept_str+
 ' group by departmentname';
dm.ADODataSet_cx.Active:=true;
DBGridEh4.Columns.RebuildColumns;
dbgrideh4.Columns.Items[0].Width:=80;
dbgrideh4.Columns.Items[1].Width:=50;
dbgrideh4.Columns.Items[2].Width:=50;
dbgrideh4.Columns.Items[3].Width:=50;
dbgrideh4.Columns.Items[4].Width:=50;
dbgrideh4.Columns.Items[5].Width:=50;
dbgrideh4.Columns.Items[6].Width:=50;

end;

 if   RadioButton_cbhz.Checked then
begin
dbgrideh4.PopupMenu:=nil;
DM.ADODataSet_cx.Active:=false;
dm.DataSource_cx.DataSet:=dm.ADODataSet_cx;
dm.ADODataSet_cx.CommandText:='select sum(breakfast) as 早餐,'+
' sum(lunch) as 午餐 ,sum(supper)as 晚餐,sum([night snack]) as 宵夜,sum(invalid_card) as 无效卡  from dbo.View_canci_'+leftstr(main_form.ComboBox1.Text,2)+
' where meal_date >='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)) +
 ' and  meal_date <='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date))+dept_str;
dm.ADODataSet_cx.Active:=true;
DBGridEh4.Columns.RebuildColumns;
dbgrideh4.Columns.Items[0].Width:=90;
dbgrideh4.Columns.Items[1].Width:=90;
dbgrideh4.Columns.Items[2].Width:=90;
dbgrideh4.Columns.Items[3].Width:=90;
dbgrideh4.Columns.Items[4].Width:=90;


end;


 if   RadioButton_jcmx.Checked then
begin
dbgrideh4.PopupMenu:=PopupMenu_cx;
if edit_cxgh.text=''then
begin
DM.ADODataSet_cx.Active:=false;
dm.DataSource_cx.DataSet:=dm.ADODataSet_cx;
dm.ADODataSet_cx.CommandText:='select departmentname as 部门,empid as 工号 ,empname as 姓名, breakfast as 早餐 ,'+
'lunch as 午餐 , supper as 晚餐, [night snack] as 宵夜, invalid_card as 无效卡, meal_date as 就餐日期, card_time as 打卡时间  from dbo.View_canci_'+leftstr(main_form.ComboBox1.Text,2)+
 ' where meal_date >='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)) +
 ' and  meal_date <='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date))+dept_str+
 ' order by departmentname,empname,meal_date';
dm.ADODataSet_cx.Active:=true;
DBGridEh4.Columns.RebuildColumns;
dbgrideh4.Columns.Items[0].Width:=80;
dbgrideh4.Columns.Items[1].Width:=40;
dbgrideh4.Columns.Items[2].Width:=40;
dbgrideh4.Columns.Items[3].Width:=28;
dbgrideh4.Columns.Items[4].Width:=28;
dbgrideh4.Columns.Items[5].Width:=28;
dbgrideh4.Columns.Items[6].Width:=28;
dbgrideh4.Columns.Items[7].Width:=35;
dbgrideh4.Columns.Items[8].Width:=60;
dbgrideh4.Columns.Items[9].Width:=110;
dbgrideh4.Width:=520;
end;
if   edit_cxgh.text<>''then
begin
DM.ADODataSet_cx.Active:=false;
dm.DataSource_cx.DataSet:=dm.ADODataSet_cx;
dm.ADODataSet_cx.CommandText:='select departmentname as 部门,empid as 工号 ,empname as 姓名, breakfast as 早餐 ,'+
'lunch as 午餐 , supper as 晚餐, [night snack] as 宵夜, invalid_card as 无效卡, meal_date as 就餐日期, card_time as 打卡时间  from dbo.View_canci_'+leftstr(main_form.ComboBox1.Text,2)+
 ' where meal_date >='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date)) +
 ' and  meal_date <='+ quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date))+dept_str+
 'and empid like'+quotedstr(edit_cxgh.Text+'%')+
 ' order by departmentname,empname,meal_date';
dm.ADODataSet_cx.Active:=true;
DBGridEh4.Columns.RebuildColumns;
dbgrideh4.Columns.Items[0].Width:=70;
dbgrideh4.Columns.Items[1].Width:=40;
dbgrideh4.Columns.Items[2].Width:=40;
dbgrideh4.Columns.Items[3].Width:=28;
dbgrideh4.Columns.Items[4].Width:=28;
dbgrideh4.Columns.Items[5].Width:=28;
dbgrideh4.Columns.Items[6].Width:=28;
dbgrideh4.Columns.Items[7].Width:=35;
dbgrideh4.Columns.Items[8].Width:=60;
dbgrideh4.Columns.Items[9].Width:=110;
dbgrideh4.Width:=520;
end;
end;
 //月结报表
if   RadioButton_yjbb.Checked then
begin
dbgrideh4.PopupMenu:=nil;
DM.ADODataSet_cx.Active:=false;
dm.ADOTMP.SQL.Clear;

if checkbox_ygc.Checked=true  then
dm.ADOTMP.SQL.Text:='exec dbo.sp_ADOmealtotting_up '
+quotedstr(leftstr(main_form.ComboBox1.Text,2)+flag_mealtype)+
','+quotedstr(edit_meal1.Text)+
','+quotedstr(edit_meal2.Text)+
','+quotedstr(edit_meal3.Text)+
','+quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date))+','+
quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date))
else
dm.ADOTMP.SQL.Text:='exec dbo.sp_ADOmealtotting_up '
+quotedstr(leftstr(main_form.ComboBox1.Text,2)+flag_mealtype)+
','+quotedstr(edit_meal5.Text)+
','+quotedstr(edit_meal6.Text)+
','+quotedstr(edit_meal7.Text)+
','+quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date))+','+
quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date));


dm.DataSource_cx.DataSet:=dm.ADOTMP;
dm.DataSource_cx.DataSet.Open;
dm.ADOTMP.ExecSQL;
DBGridEh4.Columns.RebuildColumns;
dbgrideh4.Columns.Items[0].Width:=60;
dbgrideh4.Columns.Items[1].Width:=40;
dbgrideh4.Columns.Items[2].Width:=40;
dbgrideh4.Columns.Items[3].Width:=45;
dbgrideh4.Columns.Items[4].Width:=45;
dbgrideh4.Columns.Items[5].Width:=45;
dbgrideh4.Columns.Items[6].Width:=45;
dbgrideh4.Columns.Items[7].Width:=45;
dbgrideh4.Columns.Items[8].Width:=45;
dbgrideh4.Columns.Items[9].Width:=50;
dbgrideh4.Width:=520;
dbgrideh4.OnTitleClick:=nil;
end;
//月结夜宵报表
if   RadioButton_yjyxbb.Checked then
begin
dbgrideh4.PopupMenu:=nil;
DM.ADODataSet_cx.Active:=false;
dm.ADOTMP.SQL.Clear;

if checkbox_ygc.Checked=true  then
dm.ADOTMP.SQL.Text:='exec sp_ADOmealtotting_up_yx '
+quotedstr(leftstr(main_form.ComboBox1.Text,2)+flag_mealtype)+
','+quotedstr(edit_meal4.Text)+
','+quotedstr(edit_meal2.Text)+
','+quotedstr(edit_meal3.Text)+
','+quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date))+','+
quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date))
else
dm.ADOTMP.SQL.Text:='exec sp_ADOmealtotting_up_yx '
+quotedstr(leftstr(main_form.ComboBox1.Text,2)+flag_mealtype)+
','+quotedstr(edit_meal8.Text)+
','+quotedstr(edit_meal6.Text)+
','+quotedstr(edit_meal7.Text)+
','+quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker1.Date))+','+
quotedstr(FormatDateTime('yyyy-MM-dd',DateTimePicker2.Date));



dm.DataSource_cx.DataSet:=dm.ADOTMP;
dm.DataSource_cx.DataSet.Open;
dm.ADOTMP.ExecSQL;
DBGridEh4.Columns.RebuildColumns;
dbgrideh4.Columns.Items[0].Width:=60;
dbgrideh4.Columns.Items[1].Width:=60;
dbgrideh4.Columns.Items[2].Width:=60;
dbgrideh4.Columns.Items[3].Width:=60;
dbgrideh4.Columns.Items[4].Width:=60;
dbgrideh4.Width:=520;
dbgrideh4.OnTitleClick:=nil;
end;
 Edit_cxgh.Text:='';
 edit_clocount1.Text:='0';
 label_count1.Caption:=inttostr(dm.DataSource_cx.DataSet.RecordCount);
 button_cx.Enabled:=true;
end;

procedure TMain_Form.RadioButton_ygcxClick(Sender: TObject);
begin
edit_cxgh.Enabled:=true;
label24.Enabled:=true;
dbgrideh4.PopupMenu:=nil;
end;

procedure TMain_Form.RadioButton_bmcxClick(Sender: TObject);
begin
edit_cxgh.Enabled:=false;
edit_cxgh.Text:='';
label24.Enabled:=false;
dbgrideh4.PopupMenu:=nil;
end;

procedure TMain_Form.RadioButton_cbhzClick(Sender: TObject);
begin
edit_cxgh.Enabled:=false;
edit_cxgh.Text:='';
label24.Enabled:=false;
dbgrideh4.PopupMenu:=nil;
end;

procedure TMain_Form.RadioButton_jcmxClick(Sender: TObject);
begin
edit_cxgh.Enabled:=true;
label24.Enabled:=true;
end;

procedure TMain_Form.DBGridEh4DblClick(Sender: TObject);
begin
  if   RadioButton_jcmx.Checked or radiobutton_ygcx.Checked then
    begin
  // self.Edit1.Text:= ;  //列号
Edit_cxgh.Text:=DM.ADODataSet_cx.Fields[1].Value;
 //query1.fieldbyname('name').asstring;
 // a:=strtoint(edit1.Text)-1;    //字段的位置1.2.3......   //-1因为字段是从0开始的
 //字段1等于计算机的字段0
 //  edit2.Text:=adoquery1.Fields[a].Value;    //将字段的内容显示到文本中

    end;
end;

procedure TMain_Form.DBGridEh4TitleClick(Column: TColumnEh);
begin

      if  DBGridEh4.DataSource.DataSet.Active then
      begin

      if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
      begin
         column.Title.SortMarker:=smUpEh;
         dm.ADODataSet_cx.Sort:=Column.FieldName;
      end
      else
      begin
          column.Title.SortMarker:=smDownEh;
          dm.ADODataSet_cx.Sort:=Column.FieldName+' DESC';
      end;

      if edit_clocount1.text='0' then
      begin
        self.field_name:=column.FieldName;
        Column.Title.Color := clred;
        PreColumn := column;
        edit_clocount1.Text:='1';
      end;
     if edit_clocount1.Text<>'0' then
      begin
      if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
          begin
              self.field_name:=column.FieldName;
              Column.Title.Color := clred;
              PreColumn.Title.Color := clBtnFace;
              PreColumn := column;
          end;
         end;
        end;
end;

procedure TMain_Form.Button_gxcxbClick(Sender: TObject);
begin
dm.ADOQ_updateccview.Close;
dm.ADOQ_updateccview.SQL.Text:=
' ALTER  VIEW  [dbo].[View_canci_'+leftstr(main_form.ComboBox1.Text,2)+']'+
' AS'+
' SELECT    a.id,c.departmentname,b.empname,a.empid,case when cast (a.dev_id as int) in ('+edit_meal9.Text+') then 2 else 1 end as meal_type,'+#13+
' case when a.time_e between '+quotedstr(edit_t1.Text+':00')+
' and '+quotedstr(edit_t2.Text+':00')+'  then 1 else 0 end as breakfast,'+#13+
' case when a.time_e between '+quotedstr(edit_t3.Text+':00')+
' and '+quotedstr(edit_t4.Text+':00')+'  then 1 else 0 end as lunch,'+#13+
' case when a.time_e between '+quotedstr(edit_t5.Text+':00')+
' and '+quotedstr(edit_t6.Text+':00')+'  then 1 else 0 end as supper,'+#13+
' case when a.time_e between '+quotedstr(edit_t7.Text+':00')+
' and '+#39+'23:59:59'+#39+ ' or '+
' a.time_e between '+#39+'00:00:00'+#39+' and '+quotedstr(edit_t8.Text+':00')+
' then 1 else 0 end as [night snack],'+#13+
' case when  a.time_e  not between '+quotedstr(edit_t1.Text+':00')+' and '+quotedstr(edit_t2.Text+':00')+#13+
' and a.time_e not between '+quotedstr(edit_t3.Text+':00')+' and '+quotedstr(edit_t4.Text+':00')+#13+
' and a.time_e not between '+quotedstr(edit_t5.Text+':00')+' and '+quotedstr(edit_t6.Text+':00')+#13+
' and a.time_e not between '+quotedstr(edit_t7.Text+':00')+' and '+#39+'23:59:59'+#39+#13+
' and a.time_e not between '+#39+'00:00:00'+#39+ 'and '+quotedstr(edit_t8.Text+':00')+#13+
' then 1 else 0 end as [invalid_card],'+#13+
' case when a.time_e  between '+#39+'00:00:00'+#39+ 'and '+quotedstr(edit_t8.Text+':00')+#13+
' then dateadd(day,-1,a.date_e) else a.date_e end as [meal_date],'+#13+
' a.card_time'+#13+
' FROM dbo.meal_orginaldata_'+leftstr(main_form.ComboBox1.Text,2)+  ' a '+#13+
' join jshr..employee b '+#13+
' on a.empid=b.id '+#13+
' join jshr..department c'+#13+
' on b.departmentcode=c.departmentcode ';
//+#13+'go'+#13+ 'select ' +#39+'1'+#39+'';
dm.ADOQ_updateccview.ExecSQL;
showmessage('查询视图更新成功');
button_gxcxb.Enabled:=false;
end;

procedure TMain_Form.n1Click(Sender: TObject);
begin
   //DBGridEh4.DataSource.DataSet.Locate()
 // temptest2:=main_form.DBGridEh4.SelectedField.DisplayText;
 Form_modify_card.Caption:='数据修改';
 Form_modify_card.Label_cardtime2_xg.Caption:='时间修改';
 Form_modify_card.BitBtn_cardxg.Enabled:=true;
 Form_modify_card.BitBtn_cardxg.Visible:=true;
 Form_modify_card.Label_cardtime1_cx.Visible:=true;
  Form_modify_card.BitBtn_cardadd.Enabled:=false;
 Form_modify_card.BitBtn_cardadd.Visible:=false;

  Form_modify_card.cx_empcode.Caption:=DM.ADODataSet_cx.Fields[1].Value;
  Form_modify_card.cx_empname.Caption:=DM.ADODataSet_cx.Fields[2].Value;
  Form_modify_card.cx_empcardtime.Visible:=true;
  Form_modify_card.cx_empcardtime.Caption:=DM.ADODataSet_cx.Fields[9].Value;
  Form_modify_card.MaskEdit_modify_cardtime.Text:=DM.ADODataSet_cx.Fields[9].Value;
  if Form_modify_card.ShowModal=mrok
  then
  begin
  end;
end;
procedure TMain_Form.N3Click(Sender: TObject);
begin
 Form_modify_card.Caption:='补卡';
 Form_modify_card.Label_cardtime2_xg.Caption:='补卡时间';
 Form_modify_card.BitBtn_cardadd.Enabled:=true;
 Form_modify_card.BitBtn_cardadd.Visible:=true;
 Form_modify_card.BitBtn_cardxg.Visible:=false;
 Form_modify_card.Label_cardtime1_cx.Visible:=false; 
 Form_modify_card.Label_cardtime1_cx.Visible:=false;
  Form_modify_card.cx_empcode.Caption:=DM.ADODataSet_cx.Fields[1].Value;
  Form_modify_card.cx_empname.Caption:=DM.ADODataSet_cx.Fields[2].Value;
  Form_modify_card.cx_empcardtime.Visible:=false;
  Form_modify_card.MaskEdit_modify_cardtime.Text:=DM.ADODataSet_cx.Fields[9].Value;
  if Form_modify_card.ShowModal=mrok
  then
  begin
  end;

end;










procedure TMain_Form.n2Click(Sender: TObject);
var
showmessage1 :string;
empcode_str: string;
begin
dm.ADOupdate_cx.SQL.Clear;
dm.ADOupdate_cx.SQL.Text:='delete from meal_orginaldata_'+leftstr(main_form.ComboBox1.Text,2)+
' where empid='+quotedstr(DM.ADODataSet_cx.Fields[1].Value)+
' and card_time='+ quotedstr(DM.ADODataSet_cx.Fields[9].Value);
showmessage1:=DM.ADODataSet_cx.Fields[1].Value+DM.ADODataSet_cx.Fields[2].Value+quotedstr(DM.ADODataSet_cx.Fields[9].Value)+' 将删除';
empcode_str:=DM.ADODataSet_cx.Fields[1].Value;
//
if Messagedlg('你确定'+showmessage1+'?',mtWarning,[mbYES,mbNO],0)=6 then
begin
try
dm.ADOupdate_cx.ExecSQL;
dm.ADODataSet_cx.Active:=false;
dm.ADODataSet_cx.Active:=true;
main_form.label_count1.Caption:=inttostr(dm.DataSource_cx.DataSet.RecordCount);
dm.ADODataSet_cx.Locate('工号',empcode_str,[]);
showmessage('删除成功');
except
showmessage('删除失败');
end;
end;
//
end;



procedure TMain_Form.Edit_cxghKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then button_cx.Click;
end; 
procedure TMain_Form.Button_resetdrClick(Sender: TObject);
var
i: integer;
begin
button_cz.Enabled:=false;
bitbtn4.Enabled:=false;
button_dr.Enabled:=false;
richedit1.Clear;
for i:=0 to stringgrid1.RowCount do
begin
stringgrid1.Rows[i].Clear;
end;
stringgrid1.RowCount:=5;
stringgrid1.ColCount:=5;
ProgressBar_importdata.Position:=0;
statictext_procbar.Caption:='';
button_resetdr.Enabled:=false;
opendialog_loadtxt.FileName:='';
end;

procedure TMain_Form.Button_bcjfpzClick(Sender: TObject);
var
myinifile5:Tinifile;
filepath5:string;
m1:currency;
begin
filepath5:=ExtractFilePath(Paramstr(0))+'HRCONFIG.ini';
 myinifile5:=tinifile.Create(filepath5);
 try
 m1:=StrToCurr(edit_meal1.Text);
 m1:=StrToCurr(edit_meal2.Text);
 m1:=StrToCurr(edit_meal3.Text);
 m1:=StrToCurr(edit_meal4.Text);
 m1:=StrToCurr(edit_meal5.Text);
 m1:=StrToCurr(edit_meal6.Text);
 m1:=StrToCurr(edit_meal7.Text);
 m1:=StrToCurr(edit_meal8.Text);
 
 myinifile5.WriteString('4','meal1',edit_meal1.Text);
 myinifile5.WriteString('4','meal2',edit_meal2.Text);
 myinifile5.WriteString('4','meal3',edit_meal3.Text);
 myinifile5.WriteString('4','meal4',edit_meal4.Text);
 myinifile5.WriteString('4','meal5',edit_meal5.Text);
 myinifile5.WriteString('4','meal6',edit_meal6.Text);
 myinifile5.WriteString('4','meal7',edit_meal7.Text);
 myinifile5.WriteString('4','meal8',edit_meal8.Text);
 myinifile5.WriteString('4','meal9',edit_meal9.Text);
 myinifile5.Destroy;
 showmessage('保存成功');
 Button_bbjcpz.Enabled:=false;
 edit_meal1.Enabled:=false;
 edit_meal2.Enabled:=false;
 edit_meal3.Enabled:=false;
 edit_meal4.Enabled:=false;
 edit_meal5.Enabled:=false;
 edit_meal6.Enabled:=false;
 edit_meal7.Enabled:=false;
 edit_meal8.Enabled:=false;
 edit_meal9.Enabled:=false;
 Button_bcjfpz.Enabled:=false;
 except
 showmessage('保存失败,请检查输入');
 end;
end;

procedure TMain_Form.Action3Execute(Sender: TObject);
begin
if main_form.PageControl1.TabIndex=6 then
begin
showmessage('开始修改就餐餐费设置');
edit_meal1.Enabled:=true;
edit_meal2.Enabled:=true;
edit_meal3.Enabled:=true;
edit_meal4.Enabled:=true;
edit_meal5.Enabled:=true;
edit_meal6.Enabled:=true;
edit_meal7.Enabled:=true;
edit_meal8.Enabled:=true;
edit_meal9.Enabled:=true;
Button_bcjfpz.Enabled:=true;
end;
end;

procedure TMain_Form.Edit_meal1KeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9',#8,#13,'.']) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;

procedure TMain_Form.Edit_meal2KeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in ['0'..'9',#8,#13,'.']) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;


procedure TMain_Form.Edit_meal3KeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9',#8,#13,'.']) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;

procedure TMain_Form.Edit_meal4KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9',#8,#13,'.']) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;



procedure TMain_Form.RadioButton_yjbbClick(Sender: TObject);
begin
dbgrideh4.PopupMenu:=nil;
end;

procedure TMain_Form.RadioButton_yjyxbbClick(Sender: TObject);
begin
dbgrideh4.PopupMenu:=nil;
end;

procedure TMain_Form.CheckBox_ygcClick(Sender: TObject);
begin
if CheckBox_ygc.Checked=true then
begin
CheckBox_gbc.Checked:=false;
main_form.Color:=CLBTNFACE;
panel1.Color:=CLBTNFACE;
listview1.Color:=CLBTNFACE;
listview2.Color:=CLBTNFACE;
listview3.Color:=CLBTNFACE;
memo1.Color:=CLBTNFACE;
memo2.Color:=CLBTNFACE;
dbgrideh1.Color:=CLBTNFACE;
dbgrideh2.Color:=CLBTNFACE;
Form_modify_card.Color:=CLBTNFACE;
end
else
begin
CheckBox_gbc.Checked:=true;
main_form.Color:=clmoneygreen;
panel1.Color:=clmoneygreen;
listview1.Color:=clmoneygreen;
listview2.Color:=clmoneygreen;
listview3.Color:=clmoneygreen;
memo1.Color:=clmoneygreen;
memo2.Color:=clmoneygreen;
dbgrideh1.Color:=clmoneygreen;
dbgrideh2.Color:=clmoneygreen;
Form_modify_card.Color:=clmoneygreen;
end;
 dm.ADODataSet_cx.Active:=false;
 label_count1.Caption:='0';
end;

procedure TMain_Form.CheckBox_gbcClick(Sender: TObject);
begin
if    CheckBox_gbc.Checked=true then
begin
 CheckBox_ygc.Checked:=false;
main_form.Color:=clmoneygreen;
panel1.Color:=clmoneygreen;
listview1.Color:=clmoneygreen;
listview2.Color:=clmoneygreen;
listview3.Color:=clmoneygreen;
memo1.Color:=clmoneygreen;
memo2.Color:=clmoneygreen;
dbgrideh1.Color:=clmoneygreen;
dbgrideh2.Color:=clmoneygreen;
Form_modify_card.Color:=clmoneygreen;
end
else
begin
CheckBox_ygc.Checked:=true;
main_form.Color:=CLBTNFACE;
panel1.Color:=CLBTNFACE;
listview1.Color:=CLBTNFACE;
listview2.Color:=CLBTNFACE;
listview3.Color:=CLBTNFACE;
memo1.Color:=CLBTNFACE;
memo2.Color:=CLBTNFACE;
dbgrideh1.Color:=CLBTNFACE;
dbgrideh2.Color:=CLBTNFACE;
Form_modify_card.Color:=CLBTNFACE;
end;
  dm.ADODataSet_cx.Active:=false;
  label_count1.Caption:='0';
end;

procedure TMain_Form.Edit_meal5KeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9',#8,#13,'.']) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;

procedure TMain_Form.Edit_meal6KeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9',#8,#13,'.']) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;

procedure TMain_Form.Edit_meal7KeyPress(Sender: TObject; var Key: Char);
begin
    if not (key in ['0'..'9',#8,#13,'.']) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;

procedure TMain_Form.Edit_meal8KeyPress(Sender: TObject; var Key: Char);
begin
if not (key in ['0'..'9',#8,#13,'.']) then  //判断是否输入数字
  begin
  showmessage('请输入数字');
  abort;
  end;
end;



procedure TMain_Form.Radio_mr2Click(Sender: TObject);
begin
edit_cs.Text:='25';
edit_cl.Text:='10';
edit_ds.Text:='6';
edit_dl.Text:='8';
edit_ts.Text:='14';
edit_tl.Text:='6';
edit_dvs.Text:='1';
edit_dvl.Text:='2';
BitBtn4.Enabled:=false;

end;

procedure TMain_Form.Edit_emplist_cxChange(Sender: TObject);
begin
dm.ADODataSet_emplist.Active:=false;
dm.ADOdataset_emplist.CommandText:='select  employeeid as 工号,employeename as 姓名  from T_jshr_employee where employeeid like '+quotedstr(Edit_emplist_cx.Text+'%')+
' and  employeeid not in (select employeecode from employeecard_factory_guest)'+
'and left(departmentcode,2)<>'+quotedstr(leftstr(main_form.ComboBox1.Text,2));
dm.ADODataSet_emplist.Active:=true;
end;

procedure TMain_Form.Button_bcwpClick(Sender: TObject);
begin
try
dm.ADODataSet_emptrip.UpdateBatch();
showmessage('保存成功');
except
showmessage('保存失败');
end;
end;
   {
procedure TMain_Form.Button_addempClick(Sender: TObject);
begin
 try
//dm.ADODataSet_emptrip.Insert;
dm.ADODataSet_emptrip.InsertRecord([nil,nil,1234,nil,nil,nil,nil,nil,nil]);
showmessage('新增一行记录');
except
showmessage('新增失败');
end;
end;}

procedure TMain_Form.n4Click(Sender: TObject);
var
empno: string;
empname: string;
cardno: string;
flag_i: integer;
flag: boolean;
begin
try
flag_i:=0;
empno:=DM.ADODataSet_emplist.Fields[0].Value;
empname:=DM.ADODataSet_emplist.Fields[1].Value;
dm.ADODataSet_checkempcard.CommandText:='select isnull(dbo.check_empno_card(id),0) from jshr..employee where id='+quotedstr(empno) ;
dm.ADODataSet_checkempcard.Active:=true;

cardno:=dm.ADODataSet_checkempcard.Fields[0].Value;
flag_i:=dm.ADODataSet_checkempcard.RecordCount;
//dm.DataSource_temp.DataSet.RecordCount;

if  cardno<>'0' then
begin
showmessage(empno+' '+#39+empname+#39+' '+'的发卡状态正常,卡号是'
+dm.ADODataSet_checkempcard.Fields[0].Value);
udm.flag_xuanren:=true;
end
else
begin
showmessage(empno+' '+#39+empname+#39+ '没发卡');
end ;
dm.ADODataSet_checkempcard.Active:=false;
except
 showmessage('检索失败');
 dm.ADODataSet_checkempcard.Active:=false;
end;
end;

procedure TMain_Form.PopupMenu_xuanrenPopup(Sender: TObject);
begin
if udm.flag_xuanren=true  then n5.Enabled:=true;
if udm.flag_xuanren=false then n5.Enabled:=false;
end;

procedure TMain_Form.N5Click(Sender: TObject);
var
empno: string;
empname: string;
begin
empno:=DM.ADODataSet_emplist.Fields[0].Value;
empname:=DM.ADODataSet_emplist.Fields[1].Value;
//showmessage(empno+empname);
dm.ADOTMP.SQL.Clear;
dm.ADOTMP.SQL.Text:='exec sp_emp_trip  '+
quotedstr(empno)+' , '+quotedstr(leftstr(main_form.ComboBox1.Text,2)) ;
try
dm.ADOTMP.ExecSQL;
showmessage('添加成功');
dm.ADODataSet_emptrip.Active:=false;
dm.ADODataSet_emptrip.Active:=true;
except
showmessage('添加失败');
end;
end;



procedure TMain_Form.DBGridEh6TitleClick(Column: TColumnEh);
begin

      if  DBGridEh6.DataSource.DataSet.Active then
      begin

      if (column.Title.SortMarker =smDownEh)
      or (column.Title.SortMarker =smNoneEh) then
      begin
         column.Title.SortMarker:=smUpEh;
         dm.ADODataSet_emptrip.Sort:=Column.FieldName;
      end
      else
      begin
         PreColumn.Title.Color := clBtnFace;
          Column.Title.Color := clred;
          column.Title.SortMarker:=smDownEh;
          dm.ADODataSet_emptrip.Sort:=Column.FieldName+' DESC';
                //end;

      //if edit_clocount1.text='0' then
      //begin

          self.field_name:=column.FieldName;

          PreColumn := column;
        //edit_clocount1.Text:='1';
      //end;
     //if edit_clocount1.Text<>'0' then
     // begin
      //if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
       //   begin
       //       self.field_name:=column.FieldName;
        //      Column.Title.Color := clred;
         //     PreColumn.Title.Color := clBtnFace;
          //    PreColumn := column;
          //end;
         end;
        end;





end;

procedure TMain_Form.DBGridEh6Enter(Sender: TObject);
begin

dbnavigator1.Enabled:=true;
end;



procedure TMain_Form.DBGridEh6Exit(Sender: TObject);
begin
dbnavigator1.Enabled:=false;
end;

end.



