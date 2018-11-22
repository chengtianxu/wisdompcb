unit Statistics_unt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, DB, Grids, DBGridEh, ADODB;

type
  TStatistics_frm = class(TForm)
    tlb1: TToolBar;
    btInsert: TSpeedButton;
    btEdit: TSpeedButton;
    btDelete: TSpeedButton;
    btFilter: TSpeedButton;
    btRefresh: TSpeedButton;
    btOut: TSpeedButton;
    btPrior: TSpeedButton;
    btNext: TSpeedButton;
    btClose: TSpeedButton;
    btCancel: TSpeedButton;
    btPost: TSpeedButton;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    ADODataSet1RKEY: TAutoIncField;
    ADODataSet1CODE: TStringField;
    ADODataSet1LOCATION: TStringField;
    ADODataSet1Statistics: TBooleanField;
    procedure FormShow(Sender: TObject);
    procedure btInsertClick(Sender: TObject);
    procedure btEditClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btPostClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btPriorClick(Sender: TObject);
    procedure btNextClick(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Statistics_frm: TStatistics_frm;

implementation

uses form_DM,common;

{$R *.dfm}

procedure TStatistics_frm.FormShow(Sender: TObject);
begin
  if StrToInt(vprev)<> 4 then
  ADODataSet1.LockType := ltReadOnly;
  ADODataSet1.Open;
end;

procedure TStatistics_frm.btInsertClick(Sender: TObject);
begin
//  with  ADODataSet1 do
//  begin
//    if Active then
//    begin
//      Append;
//    end;
//  end;
end;

procedure TStatistics_frm.btEditClick(Sender: TObject);
begin
  with  ADODataSet1 do
  begin
    if Active then
    begin
      Edit;
    end;
  end;
end;

procedure TStatistics_frm.btCancelClick(Sender: TObject);
begin
  with  ADODataSet1 do
  begin
    if Active then
    begin
      Cancel;
    end;
  end;
end;

procedure TStatistics_frm.btDeleteClick(Sender: TObject);
begin
//  with  ADODataSet1 do
//  begin
//    if Active then
//    begin
//      Delete;
//    end;
//  end;
end;

procedure TStatistics_frm.btPostClick(Sender: TObject);
begin
  with  ADODataSet1 do
  begin
    if Active then
    begin
      Post;
    end;
  end;
end;

procedure TStatistics_frm.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TStatistics_frm.btPriorClick(Sender: TObject);
begin
  with  ADODataSet1 do
  begin
    if Active then
    begin
      Prior;
    end;
  end;
end;

procedure TStatistics_frm.btNextClick(Sender: TObject);
begin
  with  ADODataSet1 do
  begin
    if Active then
    begin
      Next;
    end;
  end;
end;

procedure TStatistics_frm.DataSource1StateChange(Sender: TObject);
begin
  if  ADODataSet1.State IN [dsEdit,dsInsert] then
  begin
    btCancel.Enabled := True ;
    btPost  .Enabled := True ;
  end
  else
  begin
    btCancel.Enabled := False ;
    btPost  .Enabled := False ;
  end
end;

procedure TStatistics_frm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  s:integer;
begin
  with ADODataSet1 do
  if (Active) then
  if (State in [dsInsert,dsEdit]) then
  begin
    s:=messagebox(Self.Handle,'数据还没有保存，你要保存吗？','提示',MB_yesnocancel+MB_iconquestion)  ;
    //s:=MsgAsk(Get_Msg_From_ID(1),[mbYes,mbNo,mbCancel]);
    if s=idyes then
      begin
        Post;
        CanClose:=True;
      end
    else
    if s=idCancel then
    begin
      begin
        CanClose:=False;
        Exit;
      end
    end
    else
    if s=idNo then
    begin
      Cancel;
      Close;
      CanClose:=True;
    end;
  end;
end;

end.
