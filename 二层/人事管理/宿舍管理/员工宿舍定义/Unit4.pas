unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, DB, StdCtrls, DBCtrls, Mask,
  DBClient;

type
  TForm4 = class(TForm)
    DBCheckBox1: TDBCheckBox;
    Label1: TLabel;
    DBEdit_D_code: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBMemo_remark: TDBMemo;
    DataSource1: TDataSource;
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
    procedure btInsertClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btPriorClick(Sender: TObject);
    procedure btNextClick(Sender: TObject);
    procedure btPostClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DataSource1StateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit_D_codeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo_remarkKeyPress(Sender: TObject; var Key: Char);
    procedure FormDestroy(Sender: TObject);
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
  Form4: TForm4;

implementation

uses Unit1,common;

{$R *.dfm}
procedure TForm4.btInsertClick(Sender: TObject);
begin
  with DataSource1.DataSet as TClientDataSet do
  begin
    if Active then
    Append;
  end;
  FirstControl.SetFocus;
end;

procedure TForm4.btCancelClick(Sender: TObject);
begin
  with DataSource1.DataSet as TClientDataSet do
  if Active then
  begin
    Cancel;
    CancelUpdates;
    Form1.ds_Dormitorymsg.OnStateChange(Form1.ds_Dormitorymsg) ;
  end;
end;

procedure TForm4.btDeleteClick(Sender: TObject);
begin
  with DataSource1.DataSet as TClientDataSet do
  if Active then
  begin
    Delete;
    form1.Save_Dormitorymsg;
    Form1.CreateTree;
  end;
  Form1.ds_Dormitorymsg.OnStateChange(Form1.ds_Dormitorymsg) ;
end;

procedure TForm4.btPriorClick(Sender: TObject);
begin
  with DataSource1.DataSet as TClientDataSet do
  if Active then
  begin
    Prior;
  end
end;

procedure TForm4.btNextClick(Sender: TObject);
begin
  with DataSource1.DataSet as TClientDataSet do
  if Active then
  begin
    Next;
  end
end;

procedure TForm4.btPostClick(Sender: TObject);
begin
  if Form1.Save_Dormitorymsg then
  begin
    Form1.ds_Dormitorymsg.OnStateChange(Form1.ds_Dormitorymsg) ;
    Form1.CreateTree;
  end;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  
  FirstControl.SetFocus;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s:integer;
begin
  with DataSource1.DataSet as TClientDataSet do
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

procedure TForm4.DataSource1StateChange(Sender: TObject);
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
      btDelete.Enabled:=(StrToInt(vprev)in [2,4])and(Form1.cds_Bedroommsg.IsEmpty);
      btRefresh.Enabled:=True;
      btNext.Enabled:=True;
      btPrior.Enabled:=True;
 //     BitBtn3.Enabled:= False;
    end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
    FirstControl:=DBEdit_D_code;
    LastControl:=DBMemo_remark;
end;

procedure TForm4.Edit_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    if Sender is TDBMemo  then
    if (Sender as TDBMemo )  =LastControl then
    if LastControl.ReadOnly=False then
    begin
      if Form1.Save_Dormitorymsg then
      begin
        DataSource1StateChange(nil) ;
        Form1.CreateTree;
        btInsert.Click;
        FirstControl.SetFocus;
        Exit;
      end;

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
      if (Tag =1)and(ReadOnly=False)then
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

procedure TForm4.DBEdit_D_codeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Edit_KeyDown (Sender,Key ,Shift);
end;

procedure TForm4.DBMemo_remarkKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then
  Key:=Char(0);
end;

procedure TForm4.FormDestroy(Sender: TObject);
begin
  Form4 := nil;

end;

end.
