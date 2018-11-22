unit cutdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TForm_cutdate = class(TForm)
    dtpk1: TDateTimePicker;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    function find_erroedate(t_date:TDateTime): Boolean;
  public
    { Public declarations }
  end;

var
  Form_cutdate: TForm_cutdate;

implementation

uses damo,common, ADODB;

{$R *.dfm}

function TForm_cutdate.find_erroedate(t_date:TDateTime): Boolean;

begin
  Result:=false;

 with DM.ADOQuery1 do
  begin
    close;
    sql.Text:=
      'SELECT  dbo.DATA0131.rkey '+
      'FROM    dbo.DATA0131 INNER JOIN '+
      '  dbo.Data0105 ON dbo.DATA0131.GL_HEADER_PTR = dbo.Data0105.RKEY INNER JOIN '+
      '  dbo.Data0112 ON dbo.DATA0131.INVOICE_PTR = dbo.Data0112.RKEY '+
      ' where (Data0105.ENTERED_DT > '+quotedstr(DateToStr(t_date))+')'+
      ' and (Data0112.POSTED_DATE<='+quotedstr(DateToStr(t_date))+')';  //发票日期
    open;
    if not IsEmpty then
    begin
     Result:=True;
     exit;
    end;
  end;

 with DM.ADOQuery1 do
  begin
    close;
    sql.Text:=
      'SELECT     dbo.DATA0131.rkey '+
      'FROM       dbo.DATA0131 INNER JOIN '+
      '  dbo.Data0105 ON dbo.DATA0131.GL_HEADER_PTR = dbo.Data0105.RKEY INNER JOIN '+
      '  dbo.Data0116 ON dbo.DATA0131.DEBIT_PTR = dbo.Data0116.RKEY '+
      ' where (Data0105.ENTERED_DT > '+quotedstr(DateToStr(t_date))+')'+
      ' and (Data0116.MEMO_DATE<='+quotedstr(DateToStr(t_date))+')';  //发票日期
    open;
    if not IsEmpty then
    begin
     Result:=True;
     exit;
    end;
  end;

 with DM.ADOQuery1 do
  begin
    close;
    sql.Text:=
     'SELECT     dbo.DATA0131.rkey'+
     ' FROM         dbo.DATA0131 INNER JOIN'+
     '   dbo.Data0105 ON dbo.DATA0131.GL_HEADER_PTR = dbo.Data0105.RKEY INNER JOIN'+
     '   dbo.Data0064 ON dbo.DATA0131.SO_SHP_PTR = dbo.Data0064.RKEY INNER JOIN'+
     '   dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey INNER JOIN'+
     '   dbo.Data0112 ON dbo.data0439.invoice_ptr = dbo.Data0112.RKEY'+
     ' where (Data0105.ENTERED_DT > '+quotedstr(DateToStr(t_date))+')'+
     ' and (Data0112.POSTED_DATE<='+quotedstr(DateToStr(t_date))+')';  //发票日期

    open;
    if not IsEmpty then
    begin
     Result:=True;
     exit;
    end;
  end;

 with DM.ADOQuery1 do
  begin
    close;
    sql.Text:=
      'SELECT     dbo.DATA0131.rkey'+
      ' FROM    dbo.DATA0131 INNER JOIN'+
      '  dbo.Data0105 ON dbo.DATA0131.GL_HEADER_PTR = dbo.Data0105.RKEY INNER JOIN'+
      '  dbo.Data0098 ON dbo.DATA0131.RMA_PTR = dbo.Data0098.RKEY INNER JOIN'+
      '  dbo.Data0116 ON dbo.Data0098.srce_ptr = dbo.Data0116.RKEY'+
      ' where (Data0105.ENTERED_DT > '+quotedstr(DateToStr(t_date))+')'+
      ' and (Data0116.MEMO_DATE<='+quotedstr(DateToStr(t_date))+')';  //发票日期
    open;
    if not IsEmpty then
    begin
     Result:=True;
     exit;
    end;
  end;

end;

procedure TForm_cutdate.Button1Click(Sender: TObject);
var
  rkey162:Integer;
begin
 with dm.ADOQuery1 do
  begin
   Close;
   SQL.Text:='select rkey from data0162 where cut_date='+quotedstr(DateToStr(dtpk1.Date));
   Open;
  end;
 if not dm.ADOQuery1.IsEmpty then
  ShowMsg('当前期末截数日期重复不能再截数!',1)
 else
  if self.find_erroedate(dtpk1.Date) then
   ShowMsg('当前截数日期之后有开票明细,且开票明细的发票日期在截数日期之前,操作错误!',1)
  else
  begin
   try
    dm.ADOConnection1.BeginTrans;
    self.Cursor:= crSQLWait;
    with dm.ADOQuery1 do
    begin
     Close;
     SQL.Text:='insert into data0162 (cut_date,ent_date,user_ptr) '+
     'values('+quotedstr(DateToStr(dtpk1.Date))+',getdate(),'+user_ptr+')';
     ExecSQL;
    end;
     with dm.ADOQuery1 do
      begin
       Close;
       sql.Text:='select IDENT_CURRENT(''data0162'') as rkey162';
       open;
       rkey162:=FieldByName('rkey162').AsInteger
      end;
    with dm.ADOQuery1 do
     begin
       Close;
       sql.Text:='INSERT INTO DATA0163  (header_ptr,INVOICE_PTR,RUSH_CHARGE)'+#13+
       'SELECT  '+inttostr(rkey162)+'as header_ptr,rkey,'+#13+
            'INVOICE_TOTAL-RUSH_CHARGE_AMOUNT as RUSH_CHARGE' +#13+
            'FROM  Data0112'+#13+
            'WHERE (INVOICE_STATUS <> 3) AND (GLPTR_STATUS = 0) AND (INVOICE_TYPE IN (2, 3))'+#13+
            'and (POSTED_DATE<='+quotedstr(DateToStr(dtpk1.Date))+')';  //发票日期
       ExecSQL;
     end;              //插入工具费用,杂项发票
     
    with dm.ADOQuery1 do
     begin
       Close;
       sql.Text:='INSERT INTO DATA0163 (header_ptr,DEBIT_PTR,RUSH_CHARGE)'+#13+
       'SELECT  '+inttostr(rkey162)+'as header_ptr,rkey,'+#13+
            'RUSH_CHARGE-AMOUNT as RUSH_CHARGE' +#13+   //未开票金额为负数可抵扣
            'FROM  Data0116'+#13+
            'WHERE (memo_status<>3) AND (GLPTR_STATUS = 0) and (MEMO_TP = 3)'+#13+
            'and (MEMO_DATE<='+quotedstr(DateToStr(dtpk1.Date))+')';
       ExecSQL;
     end;          //插入无退货备忘

    with dm.ADOQuery1 do
     begin
       Close;
       sql.Text:='INSERT INTO DATA0163 (header_ptr,SO_SHP_PTR,QUANTITY,RUSH_CHARGE)'+#13+
      ' SELECT '+inttostr(rkey162)+'as header_ptr,dbo.Data0064.RKEY, '+#13+
      'dbo.Data0064.QUAN_SHIPPED - dbo.Data0064.ovsh_qty AS quantity,'+#13+
      ' ((dbo.Data0064.QUAN_SHIPPED - dbo.Data0064.ovsh_qty)'+#13+
      '  * dbo.Data0060.PARTS_ALLOC) * (1 + dbo.Data0064.TAX_2 * 0.01) AS rush_charge'+#13+
      ' FROM   dbo.Data0064 INNER JOIN'+#13+
      '  dbo.Data0060 ON dbo.Data0064.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
      ' dbo.data0439 ON dbo.Data0064.packing_list_ptr = dbo.data0439.rkey INNER JOIN'+#13+
      '  dbo.Data0112 ON dbo.data0439.invoice_ptr = dbo.Data0112.RKEY'+#13+
      ' WHERE (dbo.Data0064.GLPTR_STATUS = 0)'+#13+
      'and (data0112.POSTED_DATE<='+quotedstr(DateToStr(dtpk1.Date))+')';
      ExecSQL;  //插入正常指派
     end;

    with dm.ADOQuery1 do
     begin
       Close;
       sql.Text:='INSERT INTO DATA0163 (header_ptr,RMA_PTR,QUANTITY,RUSH_CHARGE)'+#13+
      'SELECT '+inttostr(rkey162)+'as header_ptr, dbo.Data0098.RKEY, '+#13+
      'dbo.Data0098.QTY_CRED - dbo.Data0098.QTY_RECD AS quantity,'+#13+
      '((dbo.Data0098.QTY_CRED - dbo.Data0098.QTY_RECD)'+#13+
      '* dbo.Data0060.PARTS_ALLOC) * (1 + dbo.Data0098.tax_2 * 0.01) AS rush_charge'+#13+
      'FROM         dbo.Data0098 INNER JOIN'+#13+
      ' dbo.Data0060 ON dbo.Data0098.SO_PTR = dbo.Data0060.RKEY INNER JOIN'+#13+
      ' dbo.Data0116 ON dbo.Data0098.srce_ptr = dbo.Data0116.RKEY'+#13+
      'WHERE     (dbo.Data0098.GLPTR_STATUS = 0)'+#13+
      'and (data0116.MEMO_DATE<='+quotedstr(DateToStr(dtpk1.Date))+')';
      ExecSQL;
     end;          //插入退货备忘

    dm.ADOConnection1.CommitTrans;
    self.Cursor:= crDefault;
    ShowMsg('截数操作成功',1);
    ModalResult:=mrok;
   except
   on E: Exception do
    begin
     dm.ADOConnection1.RollbackTrans;
     self.Cursor:= crDefault;
     messagedlg(E.Message,mterror,[mbcancel],0);
    end;
   end;
  end;

end;

procedure TForm_cutdate.FormActivate(Sender: TObject);
begin
 dtpk1.Date:=common.getsystem_date(dm.ADOQuery1,1);
 Edit1.Text:=DateTimeToStr(common.getsystem_date(DM.ADOQuery1,0));
end;

end.
