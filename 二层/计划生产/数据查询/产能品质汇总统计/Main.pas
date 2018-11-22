unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, ComCtrls, unionCon,
  DM, DateUtils, TS, common, HistoryMain, Menus, ActiveX;

type
  TFrmMain = class(TForm)
    pnl1: TPanel;
    bbt_1: TBitBtn;
    dgh_main: TDBGridEh;
    dtp1: TDateTimePicker;
    lb_1: TLabel;
    dtp2: TDateTimePicker;
    lb_2: TLabel;
    dtp3: TDateTimePicker;
    dtp4: TDateTimePicker;
    bbt_4: TBitBtn;
    lb_3: TLabel;
    bbt_3: TBitBtn;
    bbt_2: TBitBtn;
    bbt_8: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure bbt_3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbt_4Click(Sender: TObject);
    procedure bbt_2Click(Sender: TObject);
    procedure bbt_6Click(Sender: TObject);
    procedure bbt_1Click(Sender: TObject);
    procedure dgh_mainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}
  
procedure TFrmMain.bbt_3Click(Sender: TObject);
begin
  FrmunionCon := TFrmunionCon.Create(Application);
  FrmunionCon.ShowModal;
  FrmunionCon.Free;
end;

//统计
procedure TFrmMain.FormCreate(Sender: TObject);
begin

  if not app_init(damo.con1) then
  begin
    common.ShowMsg('程序启动失败,请联系系统管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;
  dtp1.Date := now - 1;
  dtp3.Date := now ;
end;

procedure TFrmMain.bbt_4Click(Sender: TObject);
var
  i, j: Integer;
  Strs: string;
begin
  //插入到729表中
  if strtoint(vprev) <> 4 then
  begin
    messagedlg('对不起! 您没有保存该数据的权限',mtinformation,[mbok],0);
    Exit;
  end;

  if dgh_main.RowCount <= 2 then
  begin
    ShowMessage('当前记录为空，保存失败！');
    Exit;
  end;

  with Damo.qrytemp do
  begin
    Close;
    SQL.Text :=  'select rkey from data0729 where Date='+ QuotedStr(DateToStr(dtp1.Date))
      + ' and ControlItemName='+ QuotedStr(damo.qry729.FieldValues['控制项目N']);
    Open;
    if not FieldByName('rkey').IsNull then
    begin
      ShowMessage('时间 '+ DateToStr(dtp1.Date) + ' 已有保存记录，请点击查看历史记录！');
      Exit;
    end;
  end;
  try
    damo.qry729.First;
    for i := 0 to dgh_main.RowCount - 2 do
    begin
      for j := 0 to damo.qry729.FieldCount - 1 do
      begin
        Strs := Strs + '''' + string(damo.qry729.FieldValues[damo.qry729.Fields[j].FieldName]) + '''' + ',';
      end;
      Strs := '(' + Copy(Strs, 0, (Length(Strs) - 1)) + ')';
      with damo.qrytemp do
      begin
        Close;
        SQL.Clear;
        SQL.Text := 'insert into data0729 values' + Strs;
        ExecSQL;
      end;
      damo.qry729.Next;
      Strs := '';
    end;
    ShowMessage('亲，该记录已保存成功！');
  except
    on e: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end; 
end;

procedure TFrmMain.bbt_2Click(Sender: TObject);
var
  i: Integer;
begin
  try
    FrmTS := TFrmTS.Create(Application);
    FrmTS.ShowModal;
    FrmTS.Free;
    with damo.qry729 do
    begin
      Close;
      SQL.Clear;
      SQL.Text := 'exec GetResultND :dtp1,:dtp2,:dtp3,:Daycount';
      Parameters.ParamByName('dtp1').Value := DateToStr(dtp1.Date) + ' ' + TimeToStr(dtp2.Time);
      Parameters.ParamByName('dtp2').Value := DateToStr(dtp3.Date) + ' ' + TimeToStr(dtp4.Time);
      Parameters.ParamByName('dtp3').Value := DateToStr(StartOfTheMonth(dtp1.Date)) + ' ' + TimeToStr(dtp2.Time);
      if Trim(Edit1.Text) = '' then
        Parameters.ParamByName('Daycount').Value := DaysBetween(dtp3.Date,StartOfTheMonth(dtp1.Date))
      else
        Parameters.ParamByName('Daycount').Value := StrToInt(Edit1.text);
      Open;
      //循环给dbgrd1的标题和FieldName的值
      for i := 0 to FieldCount - 1 do
      begin
        dgh_main.Columns[i].FieldName := Fields[i].FieldName;
      end;
    end;
  except
    on e: Exception do
    begin
      ShowMessage(e.Message);
    end;
  end;
end;

procedure TFrmMain.bbt_6Click(Sender: TObject);
begin
  FrmHistory := TFrmHistory.create(Application);
  FrmHistory.ShowModal;
  FrmHistory.free;
end;

procedure TFrmMain.bbt_1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TFrmMain.dgh_mainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  with dgh_main do
  begin
  if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
  begin
    Canvas.Font.Color :=ClYellow;
    Canvas.Brush.Color :=ClNavy;
  end
  else
  begin
  if Damo.ds729.DataSet.RecNo mod 2 <> 0 then {判断当前数据是奇数还是偶数行}
    Canvas.brush.Color :=ClWhite {如果是奇数行，DBGrid背景以白色显示}
  else
    Canvas.brush.Color :=$00EAEAEA; {如果是偶数行，DBGrid背景以浅灰色显示}
  end;
  DefaultDrawColumnCell(Rect, DataCol, Column, State); {这行很关键的，一定不要遗漏了}
  end;
end;

end.
