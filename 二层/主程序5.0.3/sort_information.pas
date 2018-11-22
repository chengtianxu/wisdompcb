unit sort_information;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, RzTabs, StdCtrls, DB, ADODB, DBCtrls,
  dbcgrids, Menus, Mask, RzPanel, RzSplit;

type
  TForm_information = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    RadioGroup1: TRadioGroup;
    DataSource1: TDataSource;
    ADS314: TADODataSet;
    ADS314USER_FULL_NAME: TStringField;
    ADS314senddate: TDateTimeField;
    ADS314MESSAGE: TStringField;
    ADS314rkey: TAutoIncField;
    ADS314hread: TStringField;
    DBCtrlGrid1: TDBCtrlGrid;
    DBText2: TDBText;
    DBText1: TDBText;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ADS14: TADODataSet;
    DataSource2: TDataSource;
    ADS14rkey: TIntegerField;
    ADS14senddate: TDateTimeField;
    ADS14MESSAGE: TStringField;
    DataSource3: TDataSource;
    ADS0314: TADODataSet;
    ADS0314USER_LOGIN_NAME: TStringField;
    ADS0314USER_FULL_NAME: TStringField;
    ADS0314TTYPE: TStringField;
    RzPanel1: TRzPanel;
    RzPanel2: TRzPanel;
    DBCtrlGrid3: TDBCtrlGrid;
    DBText3: TDBText;
    DBMemo2: TDBMemo;
    Label4: TLabel;
    PopupMenu2: TPopupMenu;
    N4: TMenuItem;
    Panel2: TPanel;
    DBCtrlGrid2: TDBCtrlGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Splitter1: TSplitter;
    ADS314whosend: TIntegerField;
    ADS314USER_LOGIN_NAME: TStringField;
    procedure SpeedButton8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DataSource2DataChange(Sender: TObject; Field: TField);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure DBCtrlGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
   OldGridWnd : TWndMethod;
   OldGridWnd1 : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
   procedure NewGridWnd1 (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form_information: TForm_information;

implementation

uses damo,common, addinfo;

{$R *.dfm}
procedure TForm_information.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    if DBctrlGrid1.DataSource.DataSet.Active then
     DBctrlGrid1.DataSource.DataSet.MoveBy(1)
    else
   else
    if DBctrlGrid1.DataSource.DataSet.Active then
     DBctrlGrid1.DataSource.DataSet.MoveBy(-1)
  end
 else
   OldGridWnd(Message);
end;

procedure TForm_information.NewGridWnd1(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    if DBctrlGrid3.DataSource.DataSet.Active then
     DBctrlGrid3.DataSource.DataSet.MoveBy(1)
    else
   else
    if DBctrlGrid3.DataSource.DataSet.Active then
     DBctrlGrid3.DataSource.DataSet.MoveBy(-1)
  end
 else
   OldGridWnd1(Message);
end;

procedure TForm_information.SpeedButton8Click(Sender: TObject);
begin
 close;
end;

procedure TForm_information.FormCreate(Sender: TObject);
begin
 self.ADS314.Close;
 self.ADS314.Parameters.ParamValues['status']:='T';
 self.ADS314.Parameters.ParamValues['rkey']:=rkey73;
 self.ADS314.Open;

 OldGridWnd := DBctrlGrid1.WindowProc;
 DBctrlGrid1.WindowProc := NewGridWnd;

 OldGridWnd1 := DBctrlGrid3.WindowProc;
 DBctrlGrid3.WindowProc := NewGridWnd1;
end;

procedure TForm_information.RadioGroup1Click(Sender: TObject);
begin
 self.ADS314.Close;
 if radiogroup1.ItemIndex=0 then
 self.ADS314.Parameters.ParamValues['status']:='T'
 else
  if radiogroup1.ItemIndex=1 then
   self.ADS314.Parameters.ParamValues['status']:='F'
  else
   self.ADS314.Parameters.ParamValues['status']:='';

 self.ADS314.Parameters.ParamValues['rkey']:=rkey73;
 self.ADS314.Open;
end;

procedure TForm_information.FormActivate(Sender: TObject);
begin
 rzpagecontrol1.ActivePageIndex:=0;
 dbctrlgrid1.SetFocus;
end;

procedure TForm_information.RzPageControl1Change(Sender: TObject);
begin
 if rzpagecontrol1.ActivePageIndex=0 then
  begin
   radiogroup1.Enabled:=true;
   speedbutton5.Enabled:=true;
   speedbutton6.Enabled:=true;
 if ads314.IsEmpty then
  begin
   speedbutton5.Enabled:=false;
   speedbutton6.Enabled:=false;
   speedbutton7.Enabled:=false;
  end
 else
  begin
   speedbutton5.Enabled:=true;
   speedbutton6.Enabled:=true;
   speedbutton7.Enabled:=true;
  end

  end
 else
  begin
   radiogroup1.Enabled:=false;
   speedbutton5.Enabled:=false;
   speedbutton6.Enabled:=false;

   if not ads14.Active then
   begin
    ADS14.Close;
    ADS14.Parameters.ParamValues['rkey']:=rkey73;
    ADS14.Open;
    self.ADS0314.Open;
   end;

   if ads14.IsEmpty then
    speedbutton7.Enabled:=false
   else
    speedbutton7.Enabled:=true;

  end;
end;

procedure TForm_information.SpeedButton6Click(Sender: TObject);
begin
if not self.ADS314.IsEmpty then
 with dm.adsTmp do
  begin
   close;
   sql.Text:='update data0314'+#13+
             'set hread=''T'''+#13+
             'where rkey='+self.ADS314rkey.AsString;
   ExecSQL;
   self.SpeedButton2Click(sender);
  end;
end;

procedure TForm_information.SpeedButton2Click(Sender: TObject);
var
 rkey:integer;
begin
 if rzpagecontrol1.ActivePageIndex=0 then
  begin
   rkey:=self.ADS314rkey.Value;
   ads314.Close;
   ads314.Open;
   if rkey>0 then self.ADS314.Locate('rkey',rkey,[]);
  end
 else
  begin
   rkey:=self.ADS14rkey.Value;
   ads14.Close;
   ads14.Open;
   if rkey>0 then self.ADS14.Locate('rkey',rkey,[]);
   ads0314.Close;
   ads0314.Open;
  end;
end;

procedure TForm_information.SpeedButton7Click(Sender: TObject);
begin
if rzpagecontrol1.ActivePageIndex=0 then
 if Msg_Dlg_Ask('您确定要删除该条收到的信息吗?','提示',1) then
 with dm.adsTmp do
  begin
   close;
   sql.Text:='delete data0314'+#13+
             'where rkey='+self.ADS314rkey.AsString;
   ExecSQL;
   self.SpeedButton2Click(sender);
  end
 else
else
 if Msg_Dlg_Ask('您确定要删除该条已发送的信息吗?','提示',1) then
 with dm.adsTmp do
  begin
   close;
   sql.Text:='delete data0014'+#13+
             'where rkey='+self.ADS14rkey.AsString;
   ExecSQL;
   self.SpeedButton2Click(sender);
  end

end;

procedure TForm_information.PopupMenu2Popup(Sender: TObject);
begin
 if ads14.IsEmpty then
  n4.Enabled:=false
 else
  n4.Enabled:=true;
end;

procedure TForm_information.PopupMenu1Popup(Sender: TObject);
begin
 if ads314.IsEmpty then
  begin
   n1.Enabled:=false;
   n2.Enabled:=false;
   n3.Enabled:=false;
  end
 else
  begin
   n1.Enabled:=true;
   n2.Enabled:=true;
   n3.Enabled:=true;
  end;
end;

procedure TForm_information.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
 if ads314.IsEmpty then
  begin
   speedbutton5.Enabled:=false;
   speedbutton6.Enabled:=false;
   speedbutton7.Enabled:=false;
  end
 else
  begin
   speedbutton5.Enabled:=true;
   speedbutton6.Enabled:=true;
   speedbutton7.Enabled:=true;
  end
end;

procedure TForm_information.DataSource2DataChange(Sender: TObject;
  Field: TField);
begin
 if ads14.IsEmpty then
  speedbutton7.Enabled:=false
 else
  speedbutton7.Enabled:=true;
end;

procedure TForm_information.SpeedButton3Click(Sender: TObject);
begin
if rzpagecontrol1.ActivePageIndex=0 then
 begin
  if not ads314.Bof then
   ads314.Prior
  else
   ShowMsg('已经到第一条记录了',1);
 end
else
 begin
  if not ads14.Bof then
   ads14.Prior
  else
   ShowMsg('已经到第一条记录了',1);
 end;
end;

procedure TForm_information.SpeedButton4Click(Sender: TObject);
begin
if rzpagecontrol1.ActivePageIndex=0 then
 begin
  if not ads314.Eof then
   ads314.Next
  else
   ShowMsg('已经到最后一条记录了',1);
 end
else
 begin
  if not ads14.Eof then
   ads14.Next
  else
   ShowMsg('已经到最后一条记录了',1);
 end;
end;

procedure TForm_information.SpeedButton1Click(Sender: TObject);
begin
with TForm_addinfo.Create(application)do
 try
  showmodal;
 finally
  free;
  SpeedButton2Click(sender);
 end;
end;

procedure TForm_information.SpeedButton5Click(Sender: TObject);
begin
with TForm_addinfo.Create(application)do
 try
  stringgrid1.Cells[0,stringgrid1.RowCount-1]:=self.ADS314USER_LOGIN_NAME.Value;
  stringgrid1.Cells[1,stringgrid1.RowCount-1]:=self.ADS314USER_FULL_NAME.Value;
  stringgrid1.Cells[2,stringgrid1.RowCount-1]:=self.ADS314whosend.AsString;
  stringgrid1.RowCount:=stringgrid1.RowCount+1;
  showmodal;
 finally
  free;
  SpeedButton2Click(sender);
 end;
end;

procedure TForm_information.DBCtrlGrid1DblClick(Sender: TObject);
begin
if (not self.ADS314.IsEmpty) and (self.ADS314hread.Value='F') then
 with dm.adsTmp do
  begin
   close;
   sql.Text:='update data0314'+#13+
             'set hread=''T'''+#13+
             'where rkey='+self.ADS314rkey.AsString;
   ExecSQL;
   SpeedButton5Click(sender);   
  end;
end;

procedure TForm_information.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 with dm.adsTmp do
  begin
   close;
   sql.Text:='update data0314'+#13+
             'set hread=''T'''+#13+
             'where hread=''F'' and emp_ptr='+rkey73;
   ExecSQL;
  end;
end;

end.
