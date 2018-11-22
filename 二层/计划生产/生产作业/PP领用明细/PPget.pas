unit PPget;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, DB, ADODB,
  DBCtrls,DateUtils, jpeg, Mask;

type
  TfrmPPget = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    btnExit: TBitBtn;
    btnQuery: TBitBtn;
    edtBarCode: TEdit;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    BitBtn7: TBitBtn;
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Splitter1: TSplitter;
    DataSource1: TDataSource;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    DBMemo1: TDBMemo;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    imgCY: TImage;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    procedure btnExitClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure edtBarCodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtBarCodeKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure edtBarCodeChange(Sender: TObject);
  private
    strSQLTxt:string;
    iSelStart,iSelLen,iSumLen:Integer;
    startTime,startTime2,startTime3,startTime4,startTime5,startTime6,endTime:LONGLONG;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPPget: TfrmPPget;

implementation

uses PasDM,common,myclass,Pick_Item_Single,ConstVar;

{$R *.dfm}

procedure TfrmPPget.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmPPget.BitBtn7Click(Sender: TObject);
var InputVar: PDlgInput ;
begin
  frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
  try
    InputVar.Fields := 'EMPL_CODE/员工代码/150,EMPLOYEE_NAME/姓名/200';
    InputVar.Sqlstr :='select rkey,EMPL_CODE,EMPLOYEE_NAME '+
                      'from data0005 where ACTIVE_FLAG=''Y'' order by rkey';
    inputvar.KeyField:='rkey';
    InputVar.AdoConn:=dm.ADOConnection1;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit1.Text:=trim(frmPick_Item_Single.adsPick.FieldValues['EMPLOYEE_NAME']);
      Edit1.Tag:=frmPick_Item_Single.adsPick.FieldValues['rkey'];
      edtBarCode.SetFocus;
    end;
  finally
    frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmPPget.FormShow(Sender: TObject);
begin
  iSelStart:=0;iSelLen:=0;iSumLen:=0;
  startTime:=0;startTime2:=0;startTime3:=0;startTime4:=0;startTime5:=0;startTime6:=0;endTime:=0;
  BitBtn7.SetFocus;
  DateTimePicker1.Date:=getsystem_date(DM.tmp,1);
  strSQLTxt:=DM.Ado732.SQL.Text;
    edtBarCode.Text:='';
    dm.cds732.Close;
    DM.cds732.Params.ParamByName('NUMBER').Value:='aaaaaaaa';
    dm.cds732.Open;
end;

procedure TfrmPPget.btnQueryClick(Sender: TObject);
var iNum,igz:Integer;
    tmpAdo:TADOQuery;
begin
  if (Trim(Edit1.Text)='') then
  begin
    ShowMsg('请选择领料人！',1);
    edtBarCode.SetFocus;
    Exit;
  end;
  if dm.cds732.RecordCount>0 then
  begin
    iNum:=0;
    try
      DM.cds732.DisableControls;
      DM.cds732.First;
      while not dm.cds732.Eof do
      begin
        if (dm.cds732.FieldByName('IsSelected').AsInteger=1) then iNum:=iNum+1;
        dm.cds732.Next;
      end;
      if (iNum>=2) then
      begin
        ShowMsg('一次只能领用一张作业单的PP，请只勾选一行即可！',1);
        Exit;
      end;
    finally
      DM.cds732.EnableControls;
    end;
    try
   //保存734------------
      tmpAdo:=TADOQuery.Create(Application);
      tmpAdo.Connection:=dm.ADOConnection1;
      igz:=0;
      iNum:=0;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='select * from dbo.data0733 where Rkey='+DM.cds732Rkey733.AsString;
      tmpAdo.Open;
      if (not tmpAdo.IsEmpty) then
      begin
        igz:=tmpAdo.FieldBYName('pick_material_qty').AsInteger; //733已领用库存
        iNum:=igz+DM.cds732panel_qty732.AsInteger;//733已领用库存+本次领用必须小于切割总张数
        if (tmpAdo.FieldByName('panel_qty').AsInteger<iNum) then
        begin
          ShowMsg('该作业单领用数量超出配额总张数，请确定领用张数！',1);
          Exit;
        end;
      end;
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='insert into dbo.data0734 (rkey732,rkey733,user_ptr,create_ptr,create_date,ttype,pick_mater_qty) '
      +'values (:rkey732,:rkey733,:user_ptr,:create_ptr,:create_date,:ttype,:pick_mater_qty)';
      tmpAdo.Parameters.ParamByName('rkey732').Value:=DM.cds732rkey732.AsInteger;
      tmpAdo.Parameters.ParamByName('rkey733').Value:=DM.cds732Rkey733.AsInteger;
      tmpAdo.Parameters.ParamByName('user_ptr').Value:=Edit1.Tag;
      tmpAdo.Parameters.ParamByName('create_ptr').Value:=user_ptr;
      tmpAdo.Parameters.ParamByName('create_date').Value:=getsystem_date(DM.tmp,0);
      tmpAdo.Parameters.ParamByName('ttype').Value:='0';
      tmpAdo.Parameters.ParamByName('pick_mater_qty').Value:=DM.cds732panel_qty732.AsInteger;
      tmpAdo.ExecSQL;
// 修改732是否领料字段为1是
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='update dbo.data0732 set matrece_flag=1 where Rkey='+DM.cds732rkey732.AsString;
      tmpAdo.ExecSQL;
// 修改对应733正常已领用PP张数为732PP配料张数
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='update dbo.data0733 set pick_material_qty='+inttostr(iNum)+' where Rkey='+DM.cds732Rkey733.AsString;
      tmpAdo.ExecSQL;
  //end 保存734------------

  //检测731对应732全部已领料，把731的是否领料修改为是------------
      tmpAdo.Close;
      tmpAdo.SQL.Clear;
      tmpAdo.SQL.Text:='select * from dbo.data0732 where Rkey731='+dm.cds732Rkey731.AsString+' and matrece_flag=0';
      tmpAdo.Open;
      if (tmpAdo.IsEmpty) then//已全部领料,修改731
      begin
        tmpAdo.Close;
        tmpAdo.SQL.Clear;
        tmpAdo.SQL.Text:='update dbo.data0731 set matrece_flag=1 where Rkey='+dm.cds732Rkey731.AsString;
        tmpAdo.ExecSQL;
      end;
    finally
      tmpAdo.Close;
      tmpAdo.Connection:=nil;
      tmpAdo.Free;
    end;
//end 保存734------------

//清除作业单-----
    edtBarCode.Text:='';
    dm.cds732.Close;
    DM.cds732.Params.ParamByName('NUMBER').Value:='aaaaaaaa';
    dm.cds732.Open;
    edtBarCode.SetFocus;
    imgCY.Picture:=nil;
  end else
  begin
    ShowMsg('没有保存记录！',1);
    edtBarCode.SetFocus;
    Exit;
  end;
end;

procedure TfrmPPget.edtBarCodeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if ((ssCtrl in Shift) and (chr(Key) in ['C', 'c'])) then Key:=0;
//  if ((ssCtrl in Shift) and (chr(Key) in ['V', 'v'])) then
//  begin
//    ShowMessage('禁用CTRL+V!');
//    edtBarCode.Text:='';
//    edtBarCode.SetFocus;
//  end;
end;

procedure TfrmPPget.edtBarCodeKeyPress(Sender: TObject; var Key: Char);
var
  LCYImg: TjpegImage;
begin
  if (Key=#13) then
  begin
//    endTime:=GetTickCount;
//    if (((startTime2-startTime)<>(startTime4-startTime3)) and ((endTime-startTime)>5000)) then
//    begin
//      ShowMsg('不能手工输入作业单！',1);
//      edtBarCode.Text:='';
//      Exit;
//    end;
    dm.cds732.Close;
    DM.cds732.Params.ParamByName('NUMBER').Value:= Trim(edtBarCode.Text);
    dm.cds732.Open;
    if not VarIsNull(DM.cds732.FieldByName('layers_image').Value) then
    begin
      LCYImg := Load_JPG_Pic_From_DB(DM.cds732.FieldByName('layers_image'));
      imgCY.Picture.Bitmap.Assign(LCYImg);
      imgCY.Stretch:=False;
      LCYImg.Free;
    end else imgCY.Picture:=nil;
    if DM.cds732.Locate('WORK_ORDER_NUMBER',edtBarCode.Text,[loCaseInsensitive]) then
    begin
      DBGridEh1.Columns[0].ReadOnly:=False;
      DBGridEh1.datasource.dataset.fields[0].readonly:=false;
      DBGridEh1.SetFocus;
      if not (DM.cds732.State in [dsEdit]) then
        DM.cds732.Edit;
      DM.cds732.FieldByName('IsSelected').AsInteger:= 1;
      btnQuery.SetFocus;
    end
    else
      edtBarCode.SelectAll;
  end;
end;

procedure TfrmPPget.DBGridEh1CellClick(Column: TColumnEh);
var
  LCYImg: TjpegImage;
begin
  with Column.Field.DataSet do
  if active then
  begin
    if not VarIsNull(DM.cds732.FieldByName('layers_image').Value) then
    begin
      LCYImg := Load_JPG_Pic_From_DB(DM.cds732.FieldByName('layers_image'));
      imgCY.Picture.Bitmap.Assign(LCYImg);
      LCYImg.Free;
    end;
  end;
end;

procedure TfrmPPget.edtBarCodeChange(Sender: TObject);
begin
  iSelStart:=edtBarCode.SelStart;
  iSelLen:=Length(edtBarCode.Text);
  if (iSelLen=1) then startTime:=GetTickCount;
  if (iSelLen=2) then startTime2:=GetTickCount;
  if (iSelLen=3) then startTime3:=GetTickCount;
  if (iSelLen=4) then startTime4:=GetTickCount;
end;

end.
