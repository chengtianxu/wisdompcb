unit UWZ137;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Grids, DBGridEh, Menus,DB,ADODB,
  StrUtils;

type
  TQuery_Form = class(TForm)
    Bar1: TStatusBar;
    Panel2: TPanel;
    Label9: TLabel;
    Label7: TLabel;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label8: TLabel;
    SpeedButton5: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    RadioGroup1: TRadioGroup;
    DTPk1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    Edit3: TEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn4: TBitBtn;
    Edit4: TEdit;
    BitBtn7: TBitBtn;
    BitBtn5: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
  private
      warehouse_ptr:integer;
      labelstring : TStrings;
      savable1 : integer;
      rkey136_1 : string;
      procedure   check_exist;
    { Private declarations }
  public
  sqlinsert: string;
    { Public declarations }
  end;

var
  Query_Form: TQuery_Form;

implementation

uses UDM137,common,pick_item_single,constvar,DateUtils, UD137, UInv;

{$R *.dfm}

procedure TQuery_Form.SpeedButton3Click(Sender: TObject);
var inputvar:PDlgInput;
begin

    frmpick_item_single:=Tfrmpick_item_single.Create(application);
    inputvar.Fields:='warehouse_code/工厂代码/60,warehouse_name/工厂名称/200,abbr_name/工厂简称/100';
    inputvar.Sqlstr:='select rkey,warehouse_code,warehouse_name,abbr_name from data0015 order by warehouse_code';
    inputvar.KeyField:='warehouse_code';
    inputvar.InPut_value:=edit3.Text;
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
    begin
      edit3.Text:=trim(frmpick_item_single.adsPick.FieldValues['warehouse_code']);
       edit3.Hint:=trim(frmpick_item_single.adsPick.FieldValues['rkey']);
     // label5.Caption := trim(frmpick_item_single.adsPick.FieldValues['abbr_name']);
      warehouse_ptr:=frmpick_item_single.adsPick.FieldValues['rkey'];
    end
    else edit3.SetFocus;
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
end;

procedure TQuery_Form.SpeedButton1Click(Sender: TObject);
var inputvar:PDlgInput;
begin
   // ListBox1.Items.Clear;
   if  (trim(Edit3.Text) ='') or (trim(Edit3.Hint) ='') then
   begin
        showmessage('请先填入正确的工厂代码1');
        Edit1.Text := '';
        Edit1.Hint :='';
        edit3.SetFocus;
        abort;
   end;
    Edit1.Text :='';
    Edit1.Hint :='';
    frmpick_item_single:=Tfrmpick_item_single.Create(application);
    inputvar.Fields:='DEPT_CODE/工序代码/100,DEPT_NAME/工序名称/300';
    inputvar.Sqlstr:='SELECT RKEY, DEPT_CODE, DEPT_NAME, TTYPE, ACTIVE_FLAG, IS_COST_DEPT FROM dbo.Data0034 WHERE (TTYPE = 1) AND (ACTIVE_FLAG = 0) AND (IS_COST_DEPT = 1)';
    inputvar.KeyField:='DEPT_CODE';
    inputvar.InPut_value:=edit1.Text;
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
    begin
      edit1.Text:=trim(frmpick_item_single.adsPick.FieldValues['DEPT_CODE']);
      edit1.Hint:=trim(frmpick_item_single.adsPick.FieldValues['RKEY']);
      //label10.Caption := trim(frmpick_item_single.adsPick.FieldValues['DEPT_NAME']);
      warehouse_ptr:=frmpick_item_single.adsPick.FieldValues['rkey'];
    end
    else edit1.SetFocus;
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
end;

procedure TQuery_Form.FormActivate(Sender: TObject);
begin
  RadioGroup1Click(nil);
end;

procedure TQuery_Form.Edit1Exit(Sender: TObject);
begin
  if edit1.Text <>'' then
  begin
      dm.ADOQuery2.Close;
      dm.ADOQuery2.SQL.Text := 'SELECT RKEY, DEPT_CODE, DEPT_NAME, TTYPE, ACTIVE_FLAG, IS_COST_DEPT FROM dbo.Data0034 WHERE (TTYPE = 1) AND (ACTIVE_FLAG = 0) AND (IS_COST_DEPT = 1) AND DEPT_CODE ='''+Edit1.text+'''';
      dm.ADOQuery2.Open;
      if dm.ADOQuery2.IsEmpty then
      begin
      showmessage('工序代码不存在...');
      edit1.SetFocus;
      abort;
      end;
  end;
end;

procedure TQuery_Form.Edit2Exit(Sender: TObject);
begin
  if edit2.Text <>'' then
  begin
      dm.ADOQuery2.Close;
      dm.ADOQuery2.SQL.Text := 'SELECT dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME FROM dbo.Data0017 INNER JOIN dbo.Data0002 ON dbo.Data0017.stock_unit_ptr=dbo.data0002.rkey  WHERE INV_PART_NUMBER = '''+Edit2.text+'''';
      dm.ADOQuery2.Open;
      if dm.ADOQuery2.IsEmpty then
      begin
      showmessage('材料代码不存在...');
      edit2.SetFocus;
      abort;
      end;
  end;
end;

procedure TQuery_Form.Edit3Exit(Sender: TObject);
begin
if edit3.Text <>'' then
  begin
      dm.ADOQuery2.Close;
      dm.ADOQuery2.SQL.Text := 'select rkey,warehouse_code,warehouse_name,abbr_name from data0015 WHERE warehouse_code= '''+Edit3.text+'''';
      dm.ADOQuery2.Open;
      if dm.ADOQuery2.IsEmpty then
      begin
        showmessage('工厂代码不存在...');
        edit3.SetFocus;
        abort;
      end;
  end;
end;

procedure TQuery_Form.BitBtn2Click(Sender: TObject);
begin
if dm.ADOConnection1.Connected then
  begin
      with dm.adoquery2 do
      begin
        dm.adoquery2.close;
        dm.adoquery2.sql.Text:=' SELECT DATEADD(mm, DATEDIFF(mm,0,getdate()), 0) AS BEGINDAY1 , '+#13+
        ' dateadd(d,-day(getdate()),dateadd(m,1,getdate())) AS ENDDAY1  ';
        dm.adoquery2.open;
        dtpk2.Date:=DateOf(dm.adoquery2.fieldvalues['ENDDAY1']+1);
        dtpk1.Date:=DateOf(dm.adoquery2.fieldvalues['BEGINDAY1']);
        dm.adoquery2.close;
      end;
  end;  

  Edit3.Text := '';
  Edit4.Text := '';
  Edit1.Text := '';
  Edit2.Text := '';
  Edit1.Hint := '';
  Edit2.Hint := '';
  Edit3.Hint := '';
  Edit4.Hint := '';
  
end;

procedure TQuery_Form.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 0  then
  begin
        BitBtn7.Visible := false;
        BitBtn5.Visible := false;
        Edit1.Visible := false;
        Edit2.Visible := false;
        Label3.Visible := false;
        Label4.Visible := false;
        Edit4.Enabled :=True;
  end else if RadioGroup1.ItemIndex = 1  then
  begin
        BitBtn7.Visible := True;
        BitBtn5.Visible := True;
        Edit1.Visible := True;
        Edit2.Visible := True;
        Label3.Visible := True;
        Label4.Visible := True;
        Edit4.Enabled :=False;
  end;
  BitBtn2Click(Sender);
end;

procedure TQuery_Form.SpeedButton4Click(Sender: TObject);
var inputvar:PDlgInput;
begin
   if  (trim(Edit3.Text) ='') or (trim(Edit3.Hint) ='') then
   begin
        showmessage('请先填入正确的工厂代码1');
        Edit2.Text :='';
        Edit2.Hint :='';
        edit3.SetFocus;
        abort;
   end;
    Edit1.Text :='';
    Edit1.Hint :='';
    frmpick_item_single:=Tfrmpick_item_single.Create(application);
    inputvar.Fields:='INV_PART_NUMBER/材料代码/200,INV_PART_DESCRIPTION/材料名称/300,UNIT_NAME/单位/50';
    inputvar.Sqlstr:=' SELECT   dbo.Data0017.RKEY, dbo.Data0017.INV_PART_NUMBER, '+#13+
                     ' dbo.Data0017.INV_PART_DESCRIPTION, dbo.Data0002.UNIT_NAME '+#13+
                     '  FROM         dbo.Data0015 INNER JOIN   '+#13+
                     ' dbo.DATA0136 ON dbo.Data0015.RKEY = dbo.DATA0136.warehouse_ptr INNER JOIN  '+#13+
                     ' dbo.DATA0155 ON dbo.DATA0136.rkey = dbo.DATA0155.control_ptr INNER JOIN '+#13+
                     ' dbo.Data0017 INNER JOIN  '+#13+
                     ' dbo.Data0002 ON dbo.Data0017.STOCK_UNIT_PTR = dbo.Data0002.RKEY ON   '+#13+
                     ' dbo.DATA0155.invt_ptr = dbo.Data0017.RKEY '+#13+
                     ' WHERE (dbo.Data0015.RKEY = '+edit3.Hint+') ORDER BY dbo.Data0017.INV_PART_NUMBER'+#13;

    inputvar.KeyField:='INV_PART_NUMBER';
   // showmsg(inputvar.Sqlstr,1);
    inputvar.InPut_value:=edit2.Text;
    inputvar.AdoConn:=dm.ADOConnection1;
    frmpick_item_single.InitForm_New(inputvar);
    if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
    begin
      edit2.Text:=trim(frmpick_item_single.adsPick.FieldValues['INV_PART_NUMBER']);
      edit2.Hint:=trim(frmpick_item_single.adsPick.FieldValues['RKEY']);

     { label6.Caption := trim(frmpick_item_single.adsPick.FieldValues['INV_PART_DESCRIPTION']);
      label8.Caption := trim(frmpick_item_single.adsPick.FieldValues['UNIT_NAME']);
      label11.Caption := trim(frmpick_item_single.adsPick.FieldValues['stan_consume']);
      warehouse_ptr:=frmpick_item_single.adsPick.FieldValues['rkey'];  }
    end
    else edit2.SetFocus;
    frmpick_item_single.adsPick.Close;
    frmpick_item_single.Free;
end;

procedure TQuery_Form.FormCreate(Sender: TObject);
begin
  if dm.ADOConnection1.Connected then
  begin
        dm.adoquery2.close;
        dm.adoquery2.sql.Text:=' SELECT DATEADD(mm, DATEDIFF(mm,0,getdate()), 0) AS BEGINDAY1 , '+#13+
        ' dateadd(d,-day(getdate()),dateadd(m,1,getdate())) AS ENDDAY1  ';
        dm.adoquery2.open;
        dtpk2.Date:=DateOf(dm.adoquery2.fieldvalues['ENDDAY1']+1);
        dtpk1.Date:=DateOf(dm.adoquery2.fieldvalues['BEGINDAY1']);
        dm.adoquery2.close;
        {dm.adoquery2.close;
        dm.adoquery2.sql.Text:='select   dateadd(dd,-day(getdate())+1,getdate())as sys_date';
        dm.adoquery2.open;
        dtpk1.Date:=DateOf(dm.adoquery2.fieldvalues['sys_date']);}
        //dm.adoquery2.close;
  end;

end;

procedure TQuery_Form.FormShow(Sender: TObject);
begin
  Edit3.SetFocus;
  savable1 := -1;
  rkey136_1 := '';
end;

procedure TQuery_Form.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then { 判定是按执行键}
   Begin
      key:=#0;
      perform(WM_NEXTDLGCTL,0,0);{移动到下一个控件}
    end;
end;

procedure TQuery_Form.BitBtn4Click(Sender: TObject);
begin

            if edit3.Text = '' then
            begin
                ShowMessage('请输入工厂代码');
                edit3.SetFocus;
                Exit;
            end else
            if RadioGroup1.ItemIndex = 0 then
            begin
                if edit4.Text = '' then
                begin
                      showmessage('请输入控制项目名称');
                      edit4.SetFocus;
                      Exit;
                end else
                     ModalResult := mrOk;
            end  else begin
                     check_exist;
                     if (edit4.Text <> '') and (rkey136_1 <> '') then
                     begin
                          ModalResult := mrOk;
                     end;
                end;


               
end;

procedure TQuery_Form.SpeedButton5Click(Sender: TObject);
var inputvar:PDlgInput;
begin
    if  (trim(Edit3.Text) ='') or (trim(Edit3.Hint) ='') then
   begin
        showmessage('请先填入正确的工厂代码1');
        Edit4.Text :='';
        Edit4.Hint :='';
        edit3.SetFocus;
        abort;
   end;
            Edit4.Text :='';
            edit4.Hint :='';
            frmpick_item_single:=Tfrmpick_item_single.Create(application);
            inputvar.Fields:='control_name/项目名称/150,WAREHOUSE_CODE/工厂代码/60,ABBR_NAME/工厂简称/200'+
                             ',GROUP_DESC/材料类型/150';
            inputvar.Sqlstr:=' SELECT   dbo.DATA0136.rkey, dbo.DATA0136.control_name, '+#13+
                             '  dbo.Data0015.WAREHOUSE_CODE, dbo.Data0015.ABBR_NAME,data0496.GROUP_DESC  '+#13+
                             '  FROM   dbo.Data0015 INNER JOIN  '+#13+
                             '  dbo.DATA0136 ON dbo.Data0015.RKEY = dbo.DATA0136.warehouse_ptr  '+#13+
                             ' inner join data0496 on data0136.PGroupID=data0496.rkey'+#13+
                             '  WHERE dbo.Data0015.rkey = '+trim(Edit3.Hint)+#13+
                             '  and (dbo.DATA0136.IsFactor=1 or data0136.IsSTime=1)'+#13;
            if (RadioGroup1.ItemIndex = 1) and (savable1 = 1) then
            inputvar.Sqlstr:= inputvar.Sqlstr + '  AND  dbo.DATA0136.rkey IN ( '+LeftStr(rkey136_1,Length(rkey136_1)-2)+' ) ';
            //ShowMessage(inputvar.Sqlstr);
            inputvar.KeyField:='control_name';
            inputvar.InPut_value:=edit4.Text;
            inputvar.AdoConn:=dm.ADOConnection1;
            frmpick_item_single.InitForm_New(inputvar);
            if (frmpick_item_single.ShowModal=mrok) and (not frmpick_item_single.adsPick.IsEmpty) then
            begin
              edit4.Text:=trim(frmpick_item_single.adsPick.FieldValues['control_name']);
              edit4.Hint:=trim(frmpick_item_single.adsPick.FieldValues['rkey']);
             // warehouse_ptr:=frmpick_item_single.adsPick.FieldValues['rkey'];
            end;
            frmpick_item_single.adsPick.Close;
            frmpick_item_single.Free;
end;

procedure TQuery_Form.Edit4Exit(Sender: TObject);
begin
  if edit4.Text <>'' then
  begin
      dm.ADOQuery2.Close;
      dm.ADOQuery2.SQL.Text := 'select rkey from data0136 WHERE RKEY= '''+Edit4.Hint+'''';
      dm.ADOQuery2.Open;
      if dm.ADOQuery2.IsEmpty then
      begin
        showmessage('项目名称不存在...');
        edit4.SetFocus;
        abort;
      end;
  end;
end;

procedure TQuery_Form.check_exist;
var
  QueryTmp:TADOQuery;
  i : Integer;
begin
    QueryTmp:=TADOQuery.Create(Self);
    QueryTmp.Connection := DM.ADOConnection1;
     if  (trim(Edit1.Hint) <> '') and (trim(Edit2.Hint) = '') then
     begin
                       with QueryTmp do
                       begin
                              try
                                  close;
                                  sql.Text:=' ( '+
                                            ' SELECT     dbo.DATA0136.rkey '+
                                            ' FROM         dbo.DATA0136 LEFT JOIN '+
                                            '                      dbo.DATA0154 ON dbo.DATA0136.rkey = dbo.DATA0154.control_ptr '+
                                            ' WHERE (dbo.DATA0154.dept_ptr = '+trim(Edit1.Hint)+' ) AND ( dbo.DATA0136.warehouse_ptr = '+trim(Query_Form.Edit3.Hint)+'  ))  '+#13;
                                          {  ' INTERSECT '+
                                            ' ( '+
                                            ' SELECT     dbo.DATA0136.rkey '+
                                            ' FROM         dbo.DATA0136 LEFT OUTER JOIN '+
                                            '                       dbo.DATA0155 ON dbo.DATA0136.rkey = dbo.DATA0155.control_ptr '+
                                            ' WHERE (dbo.DATA0155.invt_ptr = '+inttostr(Query_Form.Edit2.Hint)+' ) AND ( dbo.DATA0136.warehouse_ptr = '+inttostr(CBFac.Tag)+'  ))  '+#13; }
                                  //ShowMessage(sql.Text);
                                  Open;
                                  if (IsEmpty) and (rkey136_1 = '') then
                                  begin
                                      savable1 := 0;
                                      rkey136_1 := '';
                                  end else begin
                                       savable1 := 1;
                                       First;
                                       while not Eof do
                                       begin
                                              rkey136_1 := rkey136_1 + Fields[0].AsString + ' , ';
                                              Next;
                                       end;
                                  end;
                              except
                               DM.ADOConnection1.RollbackTrans;
                               showmessage('读取数据失败，请联系管理员');
                              end;
                       end;
     end else
     if  (trim(Edit2.Hint) <> '') and (trim(Edit1.Hint) = '') then
     begin
                       with QueryTmp do
                       begin
                              try
                                  close;
                                  sql.Text:={' ( '+
                                            ' SELECT     dbo.DATA0136.rkey '+
                                            ' FROM         dbo.DATA0136 LEFT JOIN '+
                                            '                      dbo.DATA0154 ON dbo.DATA0136.rkey = dbo.DATA0154.control_ptr '+
                                            ' WHERE (dbo.DATA0154.dept_ptr = '+inttostr(Query_Form.Edit1.Hint)+' ) AND ( dbo.DATA0136.warehouse_ptr = '+inttostr(CBFac.Tag)+'  ))  '+#13;
                                            ' INTERSECT '+ }
                                            ' ( '+
                                            ' SELECT     dbo.DATA0136.rkey '+
                                            ' FROM         dbo.DATA0136 LEFT OUTER JOIN '+
                                            '                       dbo.DATA0155 ON dbo.DATA0136.rkey = dbo.DATA0155.control_ptr '+
                                            ' WHERE (dbo.DATA0155.invt_ptr = '+trim(Edit2.Hint)+' ) AND ( dbo.DATA0136.warehouse_ptr = '+trim(Query_Form.Edit3.Hint)+'  ))  '+#13;
                                  //ShowMessage(sql.Text);
                                  Open;
                                  if (IsEmpty) and (rkey136_1 = '') then
                                  begin
                                      savable1 := 0;
                                      rkey136_1 := '';
                                  end else begin
                                       savable1 := 1;
                                       First;
                                       while not Eof do
                                       begin
                                              rkey136_1 := rkey136_1 + Fields[0].AsString + ' , ';
                                              Next;
                                       end;
                                  end;
                              except
                               DM.ADOConnection1.RollbackTrans;
                               showmessage('读取数据失败，请联系管理员');
                              end;
                       end;
     end else
     if  (trim(Edit1.Hint) <> '') and (trim(Edit2.Hint) <> '') then
     begin
                       with QueryTmp do
                       begin
                              try
                                  close;
                                  sql.Text:=' ( '+
                                            ' SELECT     dbo.DATA0136.rkey '+
                                            ' FROM         dbo.DATA0136 LEFT JOIN '+
                                            '                      dbo.DATA0154 ON dbo.DATA0136.rkey = dbo.DATA0154.control_ptr '+
                                            ' WHERE (dbo.DATA0154.dept_ptr = '+trim(Edit1.Hint)+' ) AND ( dbo.DATA0136.warehouse_ptr = '+trim(Edit3.Hint)+'  ))  '+
                                            ' INTERSECT '+
                                            ' ( '+
                                            ' SELECT     dbo.DATA0136.rkey '+
                                            ' FROM         dbo.DATA0136 LEFT OUTER JOIN '+
                                            '                       dbo.DATA0155 ON dbo.DATA0136.rkey = dbo.DATA0155.control_ptr '+
                                            ' WHERE (dbo.DATA0155.invt_ptr = '+trim(Edit2.Hint)+' ) AND ( dbo.DATA0136.warehouse_ptr = '+trim(Edit3.Hint)+'  ))  '+#13;
                                  //ShowMessage(sql.Text);
                                  Open;
                                  if (IsEmpty) and (rkey136_1 = '') then
                                  begin
                                      savable1 := 0;
                                      rkey136_1 := '';
                                  end else begin
                                       savable1 := 1;
                                       First;
                                       while not Eof do
                                       begin
                                              rkey136_1 := rkey136_1 + Fields[0].AsString + ' , ';
                                              Next;
                                       end;
                                  end;
                              except
                                DM.ADOConnection1.RollbackTrans;
                                showmessage('读取数据失败，请联系管理员');
                              end;
                       end;
     end else  if  (trim(Edit1.Hint) = '') and (trim(Edit2.Hint) = '') then
     begin
           RadioGroup1.ItemIndex := 0;
     end;
     if savable1 = 1 then
     begin
         SpeedButton5Click(nil);
     end else begin
        showmessage('您选择的工序与材料部没有相关的控制项目');
        Exit;
     end;
     QueryTmp.Free;
end;

end.
