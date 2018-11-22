unit stdTimeCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, ADODB, Menus, StdCtrls, ExtCtrls;

type
  Tfrm_stdTimeCons = class(TForm)
    PopupMenu1: TPopupMenu;
    Panel1: TPanel;
    Label1: TLabel;
    Edt_Fielter: TEdit;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    DBGridEh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure Edt_FielterChange(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
     PreColumn :TColumnEh;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_stdTimeCons: Tfrm_stdTimeCons;

implementation

uses damo,common, EquipmentTime;

{$R *.dfm}

procedure Tfrm_stdTimeCons.FormShow(Sender: TObject);
begin
  DM.ADS847.Open;
  PreColumn := DBGridEh1.Columns[0];
end;

procedure Tfrm_stdTimeCons.Edt_FielterChange(Sender: TObject);
begin
  if Trim(Edt_Fielter.Text)<>'' then
    DBGridEh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+ Trim(Edt_Fielter.Text)+'%'''
  else
    DBGridEh1.DataSource.DataSet.Filter :='';
end;

procedure Tfrm_stdTimeCons.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
  ShowMessage(DM.ADS847.CommandText);
end;

procedure Tfrm_stdTimeCons.DBGridEh1TitleClick(Column: TColumnEh);
begin

  if (Column.Title.SortMarker= smDownEh) or (Column.Title.SortMarker = smNoneEh) then
  begin
    Column.Title.SortMarker := smUpEh;
    DM.ADS847.IndexFieldNames := Column.FieldName;
  end
  else
  begin
    Column.Title.SortMarker := smDownEh;
    DM.ADS847.IndexFieldNames := Column.FieldName+' DESC';
  end;
  
  if (PreColumn.FieldName<>Column.FieldName) and (Column.Field.DataType in [ftString,ftWideString]) then
  begin
    Label1.Caption := Column.Title.Caption;
    Edt_Fielter.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clRed;
    PreColumn := Column;
  end
  else
  Edt_Fielter.SetFocus;
end;

procedure Tfrm_stdTimeCons.N1Click(Sender: TObject);
begin
  try
    frm_EquipmentTime := Tfrm_EquipmentTime.Create(Application);
    frm_EquipmentTime.v_status :=0; //新增
    if frm_EquipmentTime.ShowModal=mrok then
    begin
      DM.ADS847.Close;
      DM.ADS847.Open;
      DM.ADS847.Locate('rkey',frm_EquipmentTime.rkey847,[]);
      ShowMessage('新增成功');
    end;
  finally
    frm_EquipmentTime.Free;
  end;
end;

procedure Tfrm_stdTimeCons.N2Click(Sender: TObject);
var
  rkey847:Integer;
begin
  try
    frm_EquipmentTime := Tfrm_EquipmentTime.Create(Application);
    frm_EquipmentTime.rkey847 := DM.ADS847RKEY.Value;
    frm_EquipmentTime.v_status :=1; //编辑
    if frm_EquipmentTime.ShowModal=mrok then
    begin
      rkey847 := DM.ADS847RKEY.Value;
      with DM.ADS847 do
      begin
        Close;
        Open;
      end;
      if rkey847 >0 then
      DM.ADS847.Locate('rkey',rkey847,[]);
      ShowMessage('编辑成功');
    end;
  finally
    frm_EquipmentTime.Free;
  end;
end;

procedure Tfrm_stdTimeCons.N3Click(Sender: TObject);
begin
  if (strtoint(vprev)=1)  then
    messagedlg('对不起!您没有该程序的可修改权限',mtinformation,[mbok],0)
  else

  if MessageDlg('您确删除该设备代码的标准消耗时间设置吗?',mtConfirmation,[mbYes, mbNo],0) =mryes then
  begin
    try
      with DM.tmp do
      begin
        close;
        sql.Text:='delete data0847 where rkey ='+dm.ADS847RKEY.AsString;
        if ExecSQL>0 then
        begin
          with DM.ADS847 do
          begin
            Close;
            Open;
          end;
          ShowMessage('删除操作成功！');
        end;
      end;

    except
      on E: Exception do
      begin
        ShowMessage('该标准消耗时间');
        messagedlg(E.Message,mterror,[mbcancel],0);
      end;
    end;
  end;
end;

end.
