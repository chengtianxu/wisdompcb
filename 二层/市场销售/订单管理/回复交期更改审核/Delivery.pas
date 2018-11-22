unit Delivery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ComCtrls, Mask, DBCtrls, Menus,ConstVar,
  Buttons,DateUtils;

type
  TFrm_Delivery = class(TForm)
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    Button2: TButton;
    Popup1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Memo1: TMemo;
    dtpk1: TDateTimePicker;
    Label9: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    CheckBox1: TCheckBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridEh1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Button1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
  private
    { Private declarations }
    date:string;
    qty:Integer;
    i:Integer;
  public
    { Public declarations }
  end;

var
  Frm_Delivery: TFrm_Delivery;

implementation

uses common,dmo, add,Pick_Item_Single,main;

{$R *.dfm}

procedure TFrm_Delivery.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrm_Delivery.Button1Click(Sender: TObject);
var dTempDate,dTempDate2:string;
begin
  if (DBGridEh1.DataSource.DataSet.RecordCount>0) then
  begin
    DBGridEh1.DataSource.DataSet.First;
    dTempDate:=FormatDateTime('yyyy-MM-DD',DBGridEh1.DataSource.DataSet.FieldValues['sch_date']);
    while not DBGridEh1.DataSource.DataSet.Eof do
    begin
      DBGridEh1.DataSource.DataSet.Next;
      if (not DBGridEh1.DataSource.DataSet.Eof) then
      begin
        dTempDate2:=FormatDateTime('yyyy-MM-DD',DBGridEh1.DataSource.DataSet.FieldValues['sch_date']);
        if (dTempDate=dTempDate2) then
        begin
          ShowMsg('存在相同完工日期，请先删除相同完工日期再确定！',1);
          Exit;
        end;
        dTempDate:=dTempDate2;
      end;
    end;
  end;
  ModalResult:=mrOk;
end;

procedure TFrm_Delivery.N1Click(Sender: TObject);
var
  qty2:Integer;
begin
  Frm_add:=TFrm_add.Create(Application);
  if DBGridEh1.DataSource=dm.DataSource2 then
  begin
//2012.12.06修改完工日期默认前完工日期最大日期后加1天，遇周日再加1天-----------------
    if (dm.ADO360.RecordCount>0) then dm.ADO360.First;
    if not DM.ADO360.Eof then
    begin
      dm.ADO360.Last;
      if (DayOfTheWeek(dm.ADO360sch_date.Value+1)=7) then Frm_add.Edit1.Text:=DateToStr(dm.ADO360sch_date.Value+2)
      else Frm_add.Edit1.Text:=DateToStr(dm.ADO360sch_date.Value+1);
    end;

//    Frm_add.Edit1.Text:=Edit4.Text;
    Frm_add.DBEdit2.DataSource:=dm.DataSource2;
    dm.ADO360.Append;
    if Frm_add.ShowModal=mrok then
    begin
      qty2:=strtoint(Frm_add.DBEdit2.Text);
      if date=Frm_add.Edit1.Text then
      begin
        ShowMessage('完工日期不能相同');
        DM.ADO360.Cancel;
        Exit;
      end;  
      if StrToInt(Frm_add.DBEdit2.Text)>qty then
      begin
        ShowMessage('拆分的完工计划数量不能大于原完工计划数量');
        DM.ADO360.Cancel;
        Exit;
      end;
      dm.ADO360sch_date.Value:=StrToDate(Frm_add.Edit1.Text);
      dm.ADO360so_ptr.Value:=DM.ADO60RKEY.Value;
      DM.ADO360quantity.Value:=qty2;//2012.12.07添
      dm.ADO360.Post;
      DM.ADO360.RecNo:=i;
      DM.ADO360.Edit;
      DM.ADO360quantity.Value:=qty-qty2;
      DM.ADO360.Post;
    end;
  end
  else
  begin
//2012.12.06修改完工日期默认前完工日期最大日期后加1天，遇周日再加1天-----------------
    if (dm.ADO175.RecordCount>0) then dm.ADO175.First;
    if not DM.ADO175.Eof then
    begin
      dm.ADO175.Last;
      if (DayOfTheWeek(dm.ADO175sch_date.Value+1)=7) then Frm_add.Edit1.Text:=DateToStr(dm.ADO175sch_date.Value+2)
      else Frm_add.Edit1.Text:=DateToStr(dm.ADO175sch_date.Value+1);
    end;
//    Frm_add.Edit1.Text:=DateToStr(dtpk1.Date);
    Frm_add.DBEdit2.DataSource:=dm.DataSource3;
    dm.ADO175.Append;
    if Frm_add.ShowModal=mrok then
    begin
      qty2:=strtoint(Frm_add.DBEdit2.Text);
      if date=Frm_add.Edit1.Text then
      begin
        ShowMessage('完工日期不能相同');
        DM.ADO175.Cancel;
        Exit;
      end;
      if StrToInt(Frm_add.DBEdit2.Text)>qty then
      begin
        ShowMessage('拆分的完工计划数量不能大于原完工计划数量');
        DM.ADO175.Cancel;
        Exit;
      end;
      dm.ADO175sch_date.Value:=StrToDate(Frm_add.Edit1.Text);
      dm.ADO175rkey174.Value:=DM.ADO60rkey174.Value;
      DM.ADO175quantity.Value:=qty2;//2012.12.07添
      dm.ADO175.Post;
      DM.ADO175.RecNo:=i;
      DM.ADO175.Edit;
      DM.ADO175quantity.Value:=qty-qty2;
      DM.ADO175.Post;
      dm.ADO175.RecNo:=1;
//      dtpk1.Date:=DM.ADO175sch_date.Value;
    end;
  end;
end;

procedure TFrm_Delivery.DBGridEh1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if DBGridEh1.DataSource=dm.DataSource2 then
  begin
    date:=DateToStr(dm.ADO360sch_date.Value);
    qty:=DM.ADO360quantity.Value;  
    i:=DM.ADO360.RecNo;
  end
  else
  begin
    date:=DateToStr(dm.ADO175sch_date.Value);
    qty:=DM.ADO175quantity.Value;
    i:=dm.ADO175.RecNo;
  end;
//  i:=DM.ADO360.RecNo;
end;

procedure TFrm_Delivery.N2Click(Sender: TObject);
begin
  Frm_add:=TFrm_add.Create(Application);
  if DBGridEh1.DataSource=dm.DataSource2 then
  begin
    Frm_add.Edit1.Text:=dm.ADO360sch_date.AsString;
    Frm_add.DBEdit2.DataSource:=dm.DataSource2;
    dm.ADO360.Edit;
    if Frm_add.ShowModal=mrok then
    begin
      dm.ADO360so_ptr.Value:=dm.ADO60RKEY.Value;
      DM.ADO360sch_date.Value:=StrToDate(Frm_add.Edit1.Text);
      dm.ADO360.Post;
      dm.ADO360.RecNo:=1;
      dtpk1.Date:=dm.ADO360sch_date.Value;
    end
    else
      DM.ADO360.Cancel;
  end
  else
  begin
    Frm_add.Edit1.Text:=dm.ADO175sch_date.AsString;
    Frm_add.DBEdit2.DataSource:=dm.DataSource3;
    dm.ADO175.Edit;
    if Frm_add.ShowModal=mrok then
    begin
      dm.ADO175rkey174.Value:=dm.ADO60rkey174.Value;
      DM.ADO175sch_date.Value:=StrToDate(Frm_add.Edit1.Text);
      dm.ADO175.Post;
      dm.ADO175.RecNo:=1;
      dtpk1.Date:=dm.ADO175sch_date.Value;
    end
    else
      DM.ADO175.Cancel;
  end;
  Frm_add.Free;
end;

procedure TFrm_Delivery.N3Click(Sender: TObject);
var
  q:Integer;
begin
  if messagedlg('您确定要删除该项计划吗?',mtconfirmation,[mbYes,mbNo],0)=mryes then
  begin
    if DBGridEh1.DataSource=dm.DataSource2 then
    begin
      if DM.ADO360.RecordCount>1 then
      begin
        q:=DM.ADO360quantity.Value;
        dm.ado360.delete;
        DM.ADO360.RecNo:=1;
        DM.ADO360.Edit;
        DM.ADO360quantity.Value:=DM.ADO360quantity.Value+q;
        DM.ADO360.Post;
      end;
    end
    else
    begin
      if DM.ADO175.RecordCount>1 then
      begin
        q:=DM.ADO175quantity.Value;
        dm.ADO175.Delete;
        dm.ADO175.RecNo:=1;
        dm.ADO175.Edit;
        dm.ADO175quantity.Value:=dm.ADO175quantity.Value+q;
        dm.ADO175.Post;
      end;
//      dm.ADO175.UpdateBatch();
    end;
  end;
end;

procedure TFrm_Delivery.Button1Enter(Sender: TObject);
var
  sum_qty:Double;
begin
  if Trim(Edit1.Text)='' then
  begin
    ShowMessage('销售订单不能为空');
    Exit;
  end;
  if DBGridEh1.DataSource=dm.DataSource2 then
  begin
    DM.ADO360.First;
    while not dm.ADO360.Eof do
    begin
      sum_qty:=sum_qty+DM.ADO360quantity.Value;
      dm.ADO360.Next;
    end;
  end
  else
  begin
    DM.ADO175.First;
    while not dm.ADO175.Eof do
    begin
      sum_qty:=sum_qty+dm.ADO175quantity.Value;
      DM.ADO175.Next;
    end;
  end;
  if sum_qty<>StrToInt(Edit5.Text) then
  begin
    ShowMessage('完成数量不等于订单数量,请编辑相等!');
    Exit;
  end;
  if DBGridEh1.DataSource=dm.DataSource2 then
  begin
    with dm.ADOQuery1 do
    begin
      Close;
      SQL.Clear;
      SQL.Text:='select * from data0174 where status=0 and so_ptr='+inttostr(Edit1.Tag);
      Open;
      if not IsEmpty then
      begin
        ShowMessage('已有该订单的申请未审核');
        Edit1.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure TFrm_Delivery.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'SALES_ORDER/销售订单/100,MANU_PART_NUMBER/本厂编号/100,PARTS_ORDERED/订单数量PCS/100,SCH_DATE/回复交期/177';
    InputVar.Sqlstr := 'select data0060.RKEY,data0060.SALES_ORDER,data0060.PARTS_ORDERED,data0025.MANU_PART_NUMBER,data0060.set_ordered,data0060.ORIG_REQUEST_DATE,data0060.ORIG_SCHED_SHIP_DATE,data0060.SCH_DATE from data0060 ';
    InputVar.Sqlstr:= InputVar.Sqlstr+'inner join data0025 on data0060.CUST_PART_PTR=data0025.rkey ';
    InputVar.Sqlstr:= InputVar.Sqlstr+' WHERE STATUS<>3 and STATUS<>4 and SCH_DATE<>'''' ORDER BY SALES_ORDER';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      Edit1.Tag:= frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsInteger;
      Edit1.Text:= frmPick_Item_Single.adsPick.Fieldbyname('SALES_ORDER').AsString;
      Edit2.Text:= frmPick_Item_Single.adsPick.FieldValues['set_ordered'];
      Edit5.Text:= frmPick_Item_Single.adsPick.FieldValues['PARTS_ORDERED'];
      Edit3.Text:= frmPick_Item_Single.adsPick.Fieldbyname('ORIG_REQUEST_DATE').AsString;
      Edit6.Text:= frmPick_Item_Single.adsPick.Fieldbyname('ORIG_SCHED_SHIP_DATE').AsString;
      Edit4.Text:= frmPick_Item_Single.adsPick.Fieldbyname('SCH_DATE').AsString;
      //2012.12.06修改新回复交期默认为原回复交期
      dtpk1.Date:= StrToDate(FormatDateTime('yyyy-mm-dd',frmPick_Item_Single.adsPick.FieldByName('SCH_DATE').Value));
      dm.ADO360.Close;
      DM.ado360.Parameters[0].Value:= frmPick_Item_Single.adsPick.Fieldbyname('RKEY').AsInteger;
      dm.ADO360.Open;
    end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
end;

procedure TFrm_Delivery.Edit1Exit(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
  begin
    with dm.ADOQuery1 do
    begin
      Close;
      sql.Clear;
      SQL.Add('select RKEY,SALES_ORDER,PARTS_ORDERED,set_ordered,ORIG_REQUEST_DATE,ORIG_SCHED_SHIP_DATE,SCH_DATE from data0060 ');
      SQL.Add('where SALES_ORDER='''+Trim(Edit1.Text)+''' and STATUS<>3 and STATUS<>4 and SCH_DATE<>''''');
      Open;
      if IsEmpty then
      begin
        ShowMessage('您输入的销售订单不存在，请重新输入！');
        Edit1.SetFocus;
        Exit;
      end
      else
      begin
        Edit1.Tag:= Fieldbyname('RKEY').AsInteger;
        Edit1.Text:= Fieldbyname('SALES_ORDER').AsString;
        Edit2.Text:= FieldValues['set_ordered'];
        Edit5.Text:= FieldValues['PARTS_ORDERED'];
        Edit3.Text:= Fieldbyname('ORIG_REQUEST_DATE').AsString;
        Edit6.Text:= Fieldbyname('ORIG_SCHED_SHIP_DATE').AsString;
        Edit4.Text:= Fieldbyname('SCH_DATE').AsString;
      //2012.12.06修改新回复交期默认为原回复交期
        dtpk1.Date:= StrToDate(FormatDateTime('yyyy-mm-dd',Fieldbyname('SCH_DATE').AsDateTime));
        dm.ADO360.Close;
        DM.ado360.Parameters[0].Value:= Fieldbyname('RKEY').AsInteger;
        dm.ADO360.Open;
      end;
    end;
  end;
end;

procedure TFrm_Delivery.dtpk1Exit(Sender: TObject);
begin
//  if DBGridEh1.DataSource=dm.DataSource2 then
//  begin
//    dm.ADO360.First;
//    dm.ADO360.Edit;
//    DM.ADO360sch_date.Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk1.Date));
//    dm.ADO360.Post;
//  end
//  else
//  begin
//    dm.ADO175.First;
//    dm.ADO175.Edit;
//    DM.ADO175sch_date.Value:=StrToDate(FormatDateTime('yyyy-mm-dd',dtpk1.Date));
//    dm.ADO175.Post;
//  end;
end;

end.
