unit HistoryMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus, DBGrids;

type
  TFrmHistory = class(TForm)
    dgh_main: TDBGridEh;
    pnl1: TPanel;
    lb_1: TLabel;
    bbt_1: TBitBtn;
    bbt_5: TBitBtn;
    dtp1: TDateTimePicker;
    bbt_2: TBitBtn;
    pm_1: TPopupMenu;
    N1: TMenuItem;
    chk_1: TCheckBox;
    BitBtn1: TBitBtn;
    procedure bbt_1Click(Sender: TObject);
    procedure bbt_5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtp1Change(Sender: TObject);
    procedure bbt_2Click(Sender: TObject);
    procedure chk_1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dgh_mainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmHistory: TFrmHistory;

implementation
uses
  common, DM, Rept, UDay;
{$R *.dfm}

procedure TFrmHistory.bbt_1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmHistory.bbt_5Click(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel(dgh_main,'产能品质汇总统计结果');
end;

procedure TFrmHistory.FormShow(Sender: TObject);
var
  now: TDateTime;
begin
  with damo.qrytemp do
  begin
    SQL.Text := 'select getdate() as dtp';
    Open;
    now := FieldValues['dtp'];
  end;
  dtp1.Date := now - 1;
  damo.qry729s.Close;
  damo.qry729s.Parameters[0].Value := dtp1.Date;
  damo.qry729s.Open;
end;

procedure TFrmHistory.dtp1Change(Sender: TObject);
begin
  damo.qry729s.Close;
  damo.qry729s.Parameters[0].Value := dtp1.Date;
  damo.qry729s.Open;
end;

procedure TFrmHistory.bbt_2Click(Sender: TObject);
begin
  FrmRep := TFrmRep.Create(application);
  try
    FrmRep.dsADS729.Close;
    FrmRep.dsADS729.Parameters[0].Value := dtp1.Date;
    FrmRep.dsADS729.Open;
    FrmRep.prprt1.Reset;
    FrmRep.prprt1.Template.FileName :=
    stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        '729report.rtm';
    FrmRep.prprt1.Template.LoadFromFile;
    FrmRep.prprt1.SaveAsTemplate:=False;
    FrmRep.prprt1.Print;
  finally
    FrmRep.dsADS729.Close;
    FrmRep.Free;
  end;
end;

procedure TFrmHistory.chk_1Click(Sender: TObject);
begin
  if strtoint(vprev) <> 4 then
  begin
    messagedlg('对不起! 您没有该功能的设置权限',mtinformation,[mbok],0);
    chk_1.Checked := False;
    Exit;
  end;
  if chk_1.Checked then
    begin
      FrmHistory.dgh_main.Options := FrmHistory.dgh_main.Options-[dgRowSelect];
      FrmHistory.dgh_main.Options := FrmHistory.dgh_main.Options+[dgEditing];
      FrmHistory.dgh_main.Options := FrmHistory.dgh_main.Options-[dgMultiselect];
      dgh_main.ReadOnly := False;
      dgh_main.Columns[6].Color := clSkyBlue;

    end
  else
    begin
      FrmHistory.dgh_main.Options := FrmHistory.dgh_main.Options-[dgEditing];
      FrmHistory.dgh_main.Options := FrmHistory.dgh_main.Options+[dgRowSelect];
      FrmHistory.dgh_main.Options := FrmHistory.dgh_main.Options+[dgMultiselect];
      dgh_main.ReadOnly := True;
      dgh_main.Columns[6].Color := clWindow;
    end;
end;

procedure TFrmHistory.BitBtn1Click(Sender: TObject);
var
  i: Integer;
begin
  if strtoint(vprev) <> 4 then
  begin
    messagedlg('对不起! 您没有该功能的设置权限',mtinformation,[mbok],0);
    Exit;
  end;
  damo.UDayStr:='';
  if dgh_main.SelectedRows.Count > 0 then
  with dgh_main.DataSource.DataSet do
  for i:=0 to dgh_main.SelectedRows.Count-1 do
  begin
    GotoBookmark(pointer(dgh_main.SelectedRows.Items[i]));
    damo.UDayStr := damo.UDayStr + IntToStr(dgh_main.DataSource.DataSet.FieldValues['rkey']) + ',';
  end;
  damo.UDayStr := Copy(damo.UDayStr, 0, Length(damo.UDayStr)-1);
  FrmUDay := TFrmUDay.create(Application);
  FrmUDay.ShowModal;
  FrmUDay.free;
end;

procedure TFrmHistory.dgh_mainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
    R,T: TRect;
    i, rows: Integer;
begin
   for i :=0 to damo.qry729s.RecordCount - 1 do
   begin
     if damo.qry729s.FieldValues['MFinalProTax'] < 50 then
     begin
       R := TDBGridEh(Sender).CellRect(6,i);
       if (Rect.Left = R.Left) and (Rect.Top = R.Top) then
       begin
            (Sender AS TDBGridEh).Canvas.Brush.Color := clRed;
            (Sender AS TDBGridEh).Canvas.Brush.Style := bsSolid;
            (Sender AS TDBGridEh).Canvas.Font.Color := clHighlightText;
            (Sender AS TDBGridEh).DefaultDrawColumnCell(Rect,DataCol,Column,State);
       end;
     end;
     if damo.qry729s.FieldValues['MFinalDelTax'] < 50 then
     begin
       T := TDBGridEh(Sender).CellRect(12,i);
       if (Rect.Left = T.Left) and (Rect.Top = T.Top) then
       begin
            (Sender AS TDBGridEh).Canvas.Brush.Color := clRed;
            (Sender AS TDBGridEh).Canvas.Brush.Style := bsSolid;
            (Sender AS TDBGridEh).Canvas.Font.Color := clHighlightText;
            (Sender AS TDBGridEh).DefaultDrawColumnCell(Rect,DataCol,Column,State);
       end;
     end;
   end;
end;

end.



