unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, StdCtrls, DBCtrls, Mask, DB,
  DBClient;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit_B_code: TDBEdit;
    Label5: TLabel;
    DBComboBox1: TDBComboBox;
    DBMemo_remark: TDBMemo;
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
    procedure DBEdit_B_codeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit_B_codeEnter(Sender: TObject);
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
  Form3: TForm3;

implementation

uses Unit1,common, U_DM;

{$R *.dfm}

procedure TForm3.Edit_KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = vk_return then
  begin
    if Sender is TDBMemo  then
    if (Sender as TDBMemo )  =LastControl then
    if LastControl.ReadOnly=False then
    begin
      btPost.Click;
      btInsert.Click;
      FirstControl.SetFocus;
      Exit;
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

procedure TForm3.btInsertClick(Sender: TObject);
begin
  with form1.cds_Bedmsg do
  begin
    if Active then
    Append;
  end;
  FirstControl.SetFocus;
  DBEdit_B_codeEnter( DBEdit_B_code);
end;

procedure TForm3.btCancelClick(Sender: TObject);
begin
  with form1.cds_Bedmsg do
  if Active then
  begin
    Cancel;
    CancelUpdates;
    Form1.ds_Bedmsg.OnStateChange(Form1.ds_Bedmsg) ;
  end;
end;

procedure TForm3.btDeleteClick(Sender: TObject);
begin
  with form1.cds_Bedmsg do
  if Active then
  begin
    Delete;
    form1.Save_Bedmsg;
  end;
  Form1.ds_Bedmsg.OnStateChange(Form1.ds_Bedmsg) ;
end;

procedure TForm3.btPriorClick(Sender: TObject);
begin
  with form1.cds_Bedmsg do
  if Active then
  begin
    Prior;
  end
end;

procedure TForm3.btNextClick(Sender: TObject);
begin
  with form1.cds_Bedmsg do
  if Active then
  begin
    Next;
  end
end;

procedure TForm3.btPostClick(Sender: TObject);
begin
  if Form1.Save_Bedmsg then
  begin
    Form1.ds_Bedmsg.OnStateChange(Form1.ds_Bedmsg) ;
  end;
  
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  FirstControl.SetFocus;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s:integer;
begin
  with Form1.cds_Bedmsg do
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

procedure TForm3.DataSource1StateChange(Sender: TObject);
begin
  with DM.qry_Bedroomusemsg do
  begin
    Close;
    Parameters.ParamByName('vbedid').Value:=Form1.cds_Bedroommsgrkey.Value  ;
    Open;
  end;

  with Form1.cds_Bedmsg do
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
      btDelete.Enabled:=(StrToInt(vprev)in [2,4])and(DM.qry_Bedroomusemsg.IsEmpty);
      btRefresh.Enabled:=True;
      btNext.Enabled:=True;
      btPrior.Enabled:=True;
    end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  FirstControl:= DBEdit_B_code;
  LastControl :=DBMemo_remark;
end;

procedure TForm3.DBEdit_B_codeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Edit_KeyDown (Sender,Key ,Shift);
end;

procedure TForm3.DBEdit_B_codeEnter(Sender: TObject);
begin
  with Sender as TDBEdit do
  selStart:=length(Text);
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin
  Form3 := nil;
end;

end.
