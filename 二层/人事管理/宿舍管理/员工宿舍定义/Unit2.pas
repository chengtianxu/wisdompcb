unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ToolWin, ComCtrls, DB,
  DBClient;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    DBEdit_D_name: TDBEdit;
    Label3: TLabel;
    Edit_R_code: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    DBComboBox1: TDBComboBox;
    Label11: TLabel;
    DBMemo1: TDBMemo;
    DBMemo_equipment_remark: TDBMemo;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    tlb1: TToolBar;
    btInsert: TSpeedButton;
    btEdit: TSpeedButton;
    btPost: TSpeedButton;
    btCancel: TSpeedButton;
    btDelete: TSpeedButton;
    btFilter: TSpeedButton;
    btRefresh: TSpeedButton;
    btOut: TSpeedButton;
    btPrior: TSpeedButton;
    btNext: TSpeedButton;
    btUpload: TSpeedButton;
    btDownload: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btPrint: TSpeedButton;
    btClose: TSpeedButton;
    DataSource1: TDataSource;
    Label9: TLabel;
    edt_employeecode: TDBEdit;
    Label12: TLabel;
    edt_chinesename: TDBEdit;
    BitBtn3: TBitBtn;
    procedure btInsertClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btPriorClick(Sender: TObject);
    procedure btNextClick(Sender: TObject);
    procedure btPostClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Edit_R_codeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure DataSource1StateChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    FirstControl:TDBEdit ;
    LastControl:TDBMemo;
    procedure Edit_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1,common, U_DM,SelectItemUnit;

{$R *.dfm}

procedure TForm2.Edit_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    if Sender is TDBMemo  then
    if (Sender as TDBMemo )  =LastControl then
    if LastControl.ReadOnly=False then
    begin
      if Form1.Save_Bedroommsg then
      begin
//        DataSource1StateChange(nil) ;
        Form1.CreateTree;
        btInsert.Click;
        FirstControl.SetFocus;
        Exit;
      end;
//      btPost.Click;
//      btInsert.Click;
//      FirstControl.SetFocus;
//      Exit;
    end;

    if  Sender is TDBComboBox then
    begin
      with (Sender as TDBComboBox) do
      if  (Tag =1)and(ReadOnly=False) then
      if  Trim(Text)='' then
      begin
        (Sender as TDBComboBox).DroppedDown := true;
        Exit;
      end;
    end
    else
    if  Sender is TDBEdit then
    begin
      with (Sender as TDBEdit) do
      if  (Tag =1)and(ReadOnly=False)then
      begin
//        if (Sender as TDBEdit )=FirstControl then
//        if Trim(Text)='' then
//        BitBtn3.Click;
        if  Trim(Text)='' then
        Exit;
      end
    end;
    Postmessage(handle,WM_KEYDOWN,VK_TAB,0);
  end;  
end;

procedure TForm2.btInsertClick(Sender: TObject);
begin
  with form1.cds_Bedroommsg do
  begin
    if Active then
    Append;
  end;
  FirstControl.SetFocus;
end;

procedure TForm2.btCancelClick(Sender: TObject);
begin
  with form1.cds_Bedroommsg do
  if Active then
  begin
    Cancel;
    CancelUpdates;
    Form1.ds_Bedroommsg.OnStateChange(Form1.ds_Bedroommsg) ;
  end;
end;

procedure TForm2.btDeleteClick(Sender: TObject);
begin
  with form1.cds_Bedroommsg do
  if Active then
  begin
    Delete;
    form1.Save_Bedroommsg;
    Form1.CreateTree;
  end;
  Form1.ds_Bedroommsg.OnStateChange(Form1.ds_Bedroommsg) ;
end;

procedure TForm2.btPriorClick(Sender: TObject);
begin
  with form1.cds_Bedroommsg do
  if Active then
  begin
    Prior;
  end
end;

procedure TForm2.btNextClick(Sender: TObject);
begin
  with form1.cds_Bedroommsg do
  if Active then
  begin
    Next;
  end
end;

procedure TForm2.btPostClick(Sender: TObject);
begin
  if Form1.Save_Bedroommsg then
  begin
    Form1.ds_Bedroommsg.OnStateChange(Form1.ds_Bedroommsg) ;
    Form1.CreateTree;
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  FirstControl.SetFocus;
  
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s:integer;
begin
    with Form1.cds_Bedroommsg do
    begin
      if Active then
      if (ChangeCount>0)or (State in [dsInsert,dsEdit])then
      begin
        s:=messagebox(Self.Handle,'数据还没有保存，你要保存吗？','提示',MB_yesnocancel+MB_iconquestion)  ;
        if s=idyes then
          btPost.Click
        else
        if s=idCancel then
        begin
          Abort;
        end
        else
        if s=idNo then
        begin
          Cancel;
          CancelUpdates;
        end;
      end;
    end;
  Action := caFree;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FirstControl:=Edit_R_code;
  LastControl:=DBMemo_equipment_remark;
end;

procedure TForm2.Edit_R_codeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Edit_KeyDown (Sender,Key ,Shift);
end;

procedure TForm2.DBMemo1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Key:=Char(0)
end;

procedure TForm2.DataSource1StateChange(Sender: TObject);
begin
  with DataSource1.DataSet as TClientDataSet do
  if  (State in[dsEdit,dsInsert])or(ChangeCount>0) then
    begin
      btInsert.Enabled:=False;
      btEdit.Enabled:=False;
      btPost.Enabled:=(StrToInt(vprev)in [2,4]);
      btCancel.Enabled:=True;
      btDelete.Enabled:=False;
      btRefresh.Enabled:=False;
      btNext.Enabled:=False;
      btPrior.Enabled:=False;
    end
  else
    begin
      btInsert.Enabled:=(StrToInt(vprev)in [2,4]);
      btEdit.Enabled:=(StrToInt(vprev)in [2,4]);
      btPost.Enabled:=False;
      btCancel.Enabled:=False;
      btDelete.Enabled:=(StrToInt(vprev)in [2,4])and(Form1.cds_Bedmsg.IsEmpty);
      btRefresh.Enabled:=True;
      btNext.Enabled:=True;
      btPrior.Enabled:=True;
 //     BitBtn3.Enabled:= False;
    end;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  Form2 := nil;   //只有这样写才能将Form释放完全 和CLOSE中的Action := caFree共同完成
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
var
  Vpoint:Tpoint;
begin
  with  edt_employeecode  do
  begin
    Vpoint:= Parent.ClientToScreen(Point(Left,Top));
    if ShowAddListForm(self.Handle,DM.AQ_employeemsg_extra,'employeecode',Text,Vpoint.x,Vpoint.y+Height,400)then
    begin
      with  form1.cds_Bedroommsg   do
      begin
        if (State in [dsEdit,dsInsert])=False then
        Edit;
        FieldByName('employeecode').Value:=   DM.AQ_employeemsg_extra.FieldByName('employeecode').Value;
        FieldByName('chinesename').Value:=  DM.AQ_employeemsg_extra.FieldByName('chinesename').Value;
      end;
    end;
  end
end;

end.
