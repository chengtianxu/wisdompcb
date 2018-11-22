unit UQry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, StdCtrls, Buttons, ComCtrls,common,dateutils;

type
  TFrmQry = class(TForm)
    pnl3: TPanel;
    grp1: TGroupBox;
    grps: TGroupBox;
    EditorSgrid_condition: TStringGrid;
    lst_FieldsCN: TListBox;
    btn1: TButton;
    btn2: TButton;
    edt_QryieldName: TEdit;
    btn_Qry1: TBitBtn;
    lbl_fieldName: TLabel;
    rg_sex: TRadioGroup;
    rg_FH: TRadioGroup;
    cbb1: TComboBox;
    dtp1: TDateTimePicker;
    btn_qry: TBitBtn;
    btn_ReSet: TBitBtn;
    btn_Cancel: TBitBtn;
    dtp_f: TDateTimePicker;
    dtp_t: TDateTimePicker;
    lbl_to: TLabel;
    cbb_nation: TComboBox;
    cbb_month: TComboBox;
    rg_How: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure lst_FieldsCNClick(Sender: TObject);
    procedure btn_Qry1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn_ReSetClick(Sender: TObject);
  private
    { Private declarations }
     v_Field_List_CN,v_Field_List_EN:Variant;
      procedure UpdateSGrid(irow: integer);
  public
    { Public declarations }
  end;

var
  FrmQry: TFrmQry;

implementation
         uses udm,  Pick_Item_Single,
          ConstVar, UDepQry;
{$R *.dfm}

procedure TFrmQry.FormShow(Sender: TObject);
var
   i :integer;
begin
  //
  lst_FieldsCN.Items.Clear;
  v_Field_List_CN := VarArrayOf(['员工编号','员工姓名', '性别',
   '身份证号码','民族', '考勤卡号码','出生年月','到职日期','离职日期','婚姻状况' ,'部门',
   '职务','职级','政治面貌','文化程度','合同类型','联系电话', '宿舍编号', '员工状态', '出生月份','转正否','录用来源']);

  v_Field_List_EN := VarArrayOf(['employeemsg.employeecode','employeemsg.chinesename',
  'employeemsg.sex','employeemsg.IDCard' ,'employeemsg.nation','employeemsg.Cardno','employeemsg.birthday','employeemsg.ondutytime','employeemsg.outdutytime',
  'employeemsg.marriage','employeemsg.departmentid','dbo.employeemsg.Position','dbo.employeemsg.Rank','employeemsg.Politics_face','employeemsg.education','employeemsg.employ_type'
  ,'employeemsg.phone','employeemsg.roomcode', 'status', 'month(birthday)','employeemsg.formal','employeemsg.source']);

   for i:= vararraylowBound(v_Field_List_CN,1) to  vararrayhighBound(v_field_list_cn,1) do

    lst_fieldsCN.items.add(v_Field_List_CN[i]);

  self.EditorSgrid_condition.Cells[0,0]:='条件名';
  self.EditorSgrid_condition.Cells[1,0]:='条件值';
  self.EditorSgrid_condition.ColWidths[2]:=-1; //隐藏；
       lst_fieldsCN.itemindex := 0 ;

      self.edt_QryieldName.visible:=true;
      Self.EditorSgrid_condition.RowCount:=2;

      self.edt_QryieldName.Visible:=true;
      self.btn_Qry1.Visible:=true;

end;

procedure TFrmQry.lst_FieldsCNClick(Sender: TObject);
var
   ssql: string;
   i: integer;
begin

  self.edt_QryieldName.Visible:=false;
  self.cbb1.Visible:=false;
  self.cbb_nation.Visible:=false;
  self.cbb_month.Visible:=false;
  self.dtp1.Visible:=false;
  self.dtp_f.Visible:=false;
  self.dtp_t.Visible:=false;
  self.rg_sex.Visible:=false;
  self.rg_FH.Visible:=false;
  self.rg_How.Visible:=false;
  
   self.lbl_to.Visible:=false;
   self.btn_Qry1.Visible:=false;


   self.lbl_fieldName.Caption:=self.lst_FieldsCN.Items[self.lst_FieldsCN.itemindex];
   
    if   lst_FieldsCN.ItemIndex in [0,1]  then
    begin
     self.edt_QryieldName.Visible:=true;
     self.btn_Qry1.Visible:=true;
     self.rg_how.Visible:=true;
     

    end;


     if  self.lst_FieldsCN.ItemIndex=2 then
   begin
     rg_sex.Visible:=true;
     
   end;

  if  lst_FieldsCN.ItemIndex in [3,5]  then
  begin
    self.edt_QryieldName.Visible:=true;
    rg_FH.visible:=true;

  end;

  if lst_FieldsCN.ItemIndex =4 then
   cbb_nation.Visible:=true;

   if lst_FieldsCN.ItemIndex  in [6,7,8]  then
   begin
     self.dtp_f.Visible:=true;
     dtp_t.Visible:=true;
     lbl_to.Visible:=true;
     dtp_f.Date := startofthemonth(now);
     dtp_t.date:= now;
   end;

   if lst_FieldsCN.ItemIndex =9 then                      //婚姻状况
   begin
     cbb1.Visible:=true;
      ssql:= ' select rkey, item from  dataDetail  where dictid =11 ';
      if  not common.OpenQuery(fdm.qrytemp,ssql) then exit;
      if fdm.qrytemp.recordcount<1 then  exit;
            cbb1.Items.clear;
            fdm.qrytemp.first;
     while not fdm.qrytemp.eof  do
       begin

     cbb1.Items.AddObject(fdm.qrytemp.fieldbyname('item').AsString, Tobject(fdm.qrytemp.fieldbyname('rkey').asinteger));
     fdm.qrytemp.next;
     end;
   end;


    if lst_FieldsCN.ItemIndex =11 then      //  职务
   begin
     cbb1.Visible:=true;
      ssql:= ' select rkey, item from  dataDetail  where dictid =1 ';
      if  not common.OpenQuery(fdm.qrytemp,ssql) then exit;
      if fdm.qrytemp.recordcount<1 then  exit;
       cbb1.Items.clear;
       fdm.qrytemp.first;
     while not fdm.qrytemp.eof  do
       begin

     cbb1.Items.AddObject(fdm.qrytemp.fieldbyname('item').AsString, Tobject(fdm.qrytemp.fieldbyname('rkey').asinteger));
     fdm.qrytemp.next;
     end;
   end;

      if lst_FieldsCN.ItemIndex =12 then      //  职级
   begin
     cbb1.Visible:=true;
      ssql:= ' select rkey, item from  dataDetail  where dictid =2 ';
      if  not common.OpenQuery(fdm.qrytemp,ssql) then exit;
      if fdm.qrytemp.recordcount<1 then  exit;
       cbb1.Items.clear;
       fdm.qrytemp.first;
     while not fdm.qrytemp.eof  do
     begin

     cbb1.Items.AddObject(fdm.qrytemp.fieldbyname('item').AsString, Tobject(fdm.qrytemp.fieldbyname('rkey').asinteger));
     fdm.qrytemp.next;
     end;
   end;

         if lst_FieldsCN.ItemIndex =13 then      //  政治面貌
   begin
     cbb1.Visible:=true;
      ssql:= ' select  rkey, item from  dataDetail  where dictid =4 ';
      if  not common.OpenQuery(fdm.qrytemp,ssql) then exit;
      if fdm.qrytemp.recordcount<1 then  exit;
        cbb1.Items.clear;
       fdm.qrytemp.first;
     while not fdm.qrytemp.eof  do
     begin

     cbb1.Items.AddObject(fdm.qrytemp.fieldbyname('item').AsString, Tobject(fdm.qrytemp.fieldbyname('rkey').asinteger));
     fdm.qrytemp.next;
     end;
   end;

            if lst_FieldsCN.ItemIndex =14 then      //  文化程度
   begin
     cbb1.Visible:=true;
      ssql:= ' select rkey, item from  dataDetail  where dictid =3 ';
      if  not common.OpenQuery(fdm.qrytemp,ssql) then exit;
      if fdm.qrytemp.recordcount<1 then  exit;
        cbb1.Items.clear;
      fdm.qrytemp.first;
     while not fdm.qrytemp.eof  do
     begin

     cbb1.Items.AddObject(fdm.qrytemp.fieldbyname('item').AsString, Tobject(fdm.qrytemp.fieldbyname('rkey').asinteger));
     fdm.qrytemp.next;
     end;
   end;

   if lst_FieldsCN.ItemIndex =15 then      //  文化程度
   begin
     cbb1.Visible:=true;
      ssql:= ' select rkey,item from  dataDetail  where dictid =5 ';
      if  not common.OpenQuery(fdm.qrytemp,ssql) then exit;
      if fdm.qrytemp.recordcount<1 then  exit;
            cbb1.Items.clear;
       fdm.qrytemp.first;
     while not fdm.qrytemp.eof  do
     begin

     cbb1.Items.AddObject(fdm.qrytemp.fieldbyname('item').AsString, Tobject(fdm.qrytemp.fieldbyname('rkey').asinteger));
     fdm.qrytemp.next;
     end;
   end;

   if lst_FieldsCN.ItemIndex =10 then      //  部门
   begin
      self.edt_QryieldName.Visible:=true;
      btn_Qry1.Visible:=true;
   end;

   if lst_FieldsCN.ItemIndex  in [16,17] then
   begin
    self.edt_QryieldName.Visible:=true;
    self.rg_how.Visible:=true;

   end;
       if lst_FieldsCN.ItemIndex  = 18  then
   begin
    self.cbb1.Visible:=true;
    cbb1.Items.clear;
    cbb1.Items.add('未审核');
    cbb1.Items.add('在职');
    cbb1.Items.add('离职');
   end;

   if lst_FieldsCN.ItemIndex  = 19 then
   begin
    self.cbb_month.Visible:=true;

   end;

  if lst_FieldsCN.ItemIndex  = 20  then   //转正
   begin
    self.cbb1.Visible:=true;
    cbb1.Items.clear;
    cbb1.Items.add('未转');              //0
    cbb1.Items.add('已转合格');            //1
    cbb1.Items.add('已转不合格');           //2

   end;

      if lst_FieldsCN.ItemIndex =21 then      //  录用来源
   begin
     cbb1.Visible:=true;
      ssql:= ' select rkey,item from  dataDetail  where dictid =17 ';
      if  not common.OpenQuery(fdm.qrytemp,ssql) then exit;
      if fdm.qrytemp.recordcount<1 then  exit;
            cbb1.Items.clear;
       fdm.qrytemp.first;
     while not fdm.qrytemp.eof  do
     begin

     cbb1.Items.AddObject(fdm.qrytemp.fieldbyname('item').AsString, Tobject(fdm.qrytemp.fieldbyname('rkey').asinteger));
     fdm.qrytemp.next;
     end;
   end;



end;

procedure TFrmQry.btn_Qry1Click(Sender: TObject);
 var
   // i: integer;
   // ssql: string;
    InputVar: PDlgInput ;
begin

  if self.lst_FieldsCN.ItemIndex in [0,1]  then       //工号 / 姓名
  begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  InputVar.Fields := 'EmployeeCode/工号/120,chineseName/姓名/120' ;
  InputVar.Sqlstr := 'SELECT rkey, EmployeeCode,chineseName ' + #13
    + 'FROM dbo.employeemsg '+#13;
  try
  inputvar.KeyField :='rkey';
  InputVar.AdoConn := fdm.con1;
  frmPick_Item_Single.InitForm_New(InputVar);
  if frmPick_Item_Single.ShowModal=mrok then
  begin
    if lst_FieldsCN.ItemIndex=0 then
    self.edt_QryieldName.Text := trim(frmPick_Item_Single.adsPick.fieldbyname('EmployeeCode').asstring)
    else  if self.lst_FieldsCN.ItemIndex=1 then
       self.edt_QryieldName.Text := trim(frmPick_Item_Single.adsPick.fieldbyname('chineseName').asstring)

  end;
  finally
    frmPick_Item_Single.adsPick.Close;
    frmPick_Item_Single.Free ;
  end;
  end;

   if self.lst_FieldsCN.ItemIndex=10 then
    begin
      try
     frmDepQry:=TFrmDepQry.create(nil);

     if frmDepQry.Showmodal= mrOK  then
     begin
      self.edt_QryieldName.Text:=frmDepQry.PDepName;
      edt_QryieldName.tag:=frmDepQry.Prkey;
     end;

     finally
       frmDepQry.Free;
     end;
    end;





end;

//添加条件：
procedure TFrmQry.btn1Click(Sender: TObject);
    var
       i :integer ;
begin

    if (Trim(self.edt_QryieldName.text)='' ) and (self.edt_QryieldName.visible=true ) then
   begin
    ShowMessage('亲，请先输入条件值！');
    exit;
   end;

   if (Trim(cbb1.text)='' ) and (cbb1.visible=true ) then
   begin
    ShowMessage('亲，请先输入条件值！');
    exit;
   end;

   if (Trim(cbb_month.text)='' ) and (cbb_month.visible=true ) then
   begin
    ShowMessage('亲，请先输入条件值！');
    exit;
   end;

     if (Trim(cbb_nation.text)='' ) and (cbb_nation.visible=true ) then
   begin
    ShowMessage('亲，请先输入条件值！');
    exit;
   end;



    for i:=1  to  self.EditorSgrid_condition.rowcount-2 do
    begin
      if  (self.lst_FieldsCN.items[self.lst_FieldsCN.ItemIndex]= EditorSgrid_condition.Cells[0,i])  and
         (self.lst_FieldsCN.items[self.lst_FieldsCN.ItemIndex]<> EditorSgrid_condition.Cells[1,i] )  then

        begin
          //已加入的字段条件不一样的，更新一下条件和sql

          UpdateSGrid(i);
          exit;
        end;

    end;
    
       EditorSgrid_condition.Cells[0,EditorSgrid_condition.RowCount-1]:= self.lst_FieldsCN.Items[self.lst_FieldsCN.itemindex];

       UpdateSGrid(EditorSgrid_condition.RowCount-1);    //更新已有的&  插入 sql 到striggrid
       
        EditorSgrid_condition.RowCount :=EditorSgrid_condition.RowCount +1;


end;

 procedure TFrmQry.UpdateSGrid(irow: integer);
 var
   Dt_f, dt_t: string;
 begin

  self.EditorSgrid_condition.cells[0,irow]:=self.lst_FieldsCN.Items[self.lst_FieldsCN.itemindex]; // 更新第二列


  dt_f := formatdatetime('yyyy-mm-dd',dtp_f.date);
  dt_t := formatdatetime('yyyy-mm-dd',dtp_t.date);

  
  case self.lst_FieldsCN.ItemIndex of




   0:
    begin
      EditorSgrid_condition.cells[1,irow]:= trim(self.edt_QryieldName.text);
     if rg_how.ItemIndex= 0   then
     EditorSgrid_condition.cells[2,irow]:=' and employeeCode ='''+trim(self.edt_QryieldName.text)+'''   '
    else
      EditorSgrid_condition.cells[2,irow]:=' and employeeCode like  '''+trim(self.edt_QryieldName.text)+'%''   ';

      edt_QryieldName.Clear;
     end;


   1:
   begin
      EditorSgrid_condition.cells[1,irow]:= trim(self.edt_QryieldName.text);
       if rg_how.ItemIndex= 0   then
     EditorSgrid_condition.cells[2,irow]:=' and chineseName ='''+trim(self.edt_QryieldName.text)+'''   '
    else
      EditorSgrid_condition.cells[2,irow]:=' and chineseName like  '''+trim(self.edt_QryieldName.text)+'%''   ';
      edt_QryieldName.Clear;
   end;
   2:
   begin
      EditorSgrid_condition.cells[1,irow]:= rg_Sex.items[rg_Sex.ItemIndex];
   if rg_Sex.ItemIndex=0 then
          EditorSgrid_condition.cells[2,irow]:=' and sex =0   '
    else
      EditorSgrid_condition.cells[2,irow]:=' and sex=1   ';
   end;
   3:
     begin
      EditorSgrid_condition.cells[1,irow]:= trim(self.edt_QryieldName.text);
    case  self.rg_FH.ItemIndex of
      0: EditorSgrid_condition.cells[2,irow]:=' and IDcard ='''+trim(self.edt_QryieldName.text)+'''   '  ;
      1: EditorSgrid_condition.cells[2,irow]:=' and IDcard <'''+trim(self.edt_QryieldName.text)+'''   ' ;
      2: EditorSgrid_condition.cells[2,irow]:=' and IDcard >'''+trim(self.edt_QryieldName.text)+'''   '  ;
      3: EditorSgrid_condition.cells[2,irow]:=' and IDcard like '''+trim(self.edt_QryieldName.text)+'%''   ' ;
    end;
    edt_QryieldName.Clear;
    end;
   4:
    begin
      EditorSgrid_condition.cells[1,irow]:= trim(self.cbb_nation.text);
     EditorSgrid_condition.cells[2,irow]:=' and nation ='''+trim(self.cbb_nation.text)+'''   ';
    cbb_nation.ItemIndex:=-1;
    end;
    5:      //考勤卡
    begin
      EditorSgrid_condition.cells[1,irow]:= trim(self.edt_QryieldName.text);
    case  self.rg_FH.ItemIndex of
      0: EditorSgrid_condition.cells[2,irow]:=' and CardNo ='''+trim(self.edt_QryieldName.text)+'''   '  ;
      1: EditorSgrid_condition.cells[2,irow]:=' and CardNo <'''+trim(self.edt_QryieldName.text)+'''   ' ;
      2: EditorSgrid_condition.cells[2,irow]:=' and CardNo >'''+trim(self.edt_QryieldName.text)+'''   '  ;
      3: EditorSgrid_condition.cells[2,irow]:=' and CardNo like '''+trim(self.edt_QryieldName.text)+'%''   ' ;
    end;
      edt_QryieldName.Clear;
    end;

        6:      //出生年月
    begin
    EditorSgrid_condition.cells[1,irow]:='日期从'+formatdatetime('yyyy-mm-dd',dtp_f.date)+'到 '+formatdatetime('yyyy-mm-dd',dtp_t.date)+'  ' ;
    EditorSgrid_condition.cells[2,irow]:=' and birthday >=''' +dt_f+ '''  and birthday <=''' +dt_t+ '''   '  ;
    end;
     7:      //到职日期
     begin
      EditorSgrid_condition.cells[1,irow]:='日期从'+dt_f+'到'+dt_t   ;
      EditorSgrid_condition.cells[2,irow]:=' and ondutytime >='''+dt_f+'''  and ondutytime <='''+dt_t+'''   '  ;
      end ;


       8:      //离职日期
       begin
        EditorSgrid_condition.cells[1,irow]:='日期从'+formatdatetime('yyyy-mm-dd',dtp_f.date)+'到 '+formatdatetime('yyyy-mm-dd',dtp_t.date)+'  ' ;
        EditorSgrid_condition.cells[2,irow]:=' and outdutytime >='''+dt_f+'''  and outdutytime <='''+dt_t+'''   '  ;
                        
       end;
     9:
     begin
      EditorSgrid_condition.cells[1,irow]:= cbb1.text;
        EditorSgrid_condition.cells[2,irow]:=' and marriage ='''+inttostr(integer(cbb1.Items.Objects[cbb1.itemindex]))+'''   ';
        cbb1.ItemIndex:=0;
       end;
    10:
    begin
         EditorSgrid_condition.cells[1,irow]:= TRIM(edt_QryieldName.TEXT);
         EditorSgrid_condition.cells[2,irow]:=' and departmentID ='''+inttostr(self.edt_QryieldName.tag)+'''   ';
         edt_QryieldName.Clear;
     END;
    11:
     begin
        EditorSgrid_condition.cells[1,irow]:= cbb1.TEXT;
        EditorSgrid_condition.cells[2,irow]:=' and position ='''+inttostr(integer(cbb1.Items.Objects[cbb1.itemindex]))+'''   ';
    END;
       12:
       begin
        EditorSgrid_condition.cells[1,irow]:= cbb1.TEXT;
        EditorSgrid_condition.cells[2,irow]:=' and rank ='''+inttostr(integer(cbb1.Items.Objects[cbb1.itemindex]))+'''   ';
        cbb1.ItemIndex:=-1;
        END;
       13:
        begin
        EditorSgrid_condition.cells[1,irow]:= cbb1.TEXT;
        EditorSgrid_condition.cells[2,irow]:=' and Politics_face ='''+inttostr(integer(cbb1.Items.Objects[cbb1.itemindex]))+'''   ';
        cbb1.ItemIndex:=-1;
        END;
       14:
        begin
        EditorSgrid_condition.cells[1,irow]:= cbb1.TEXT;
        EditorSgrid_condition.cells[2,irow]:=' and education ='''+inttostr(integer(cbb1.Items.Objects[cbb1.itemindex]))+'''   ';
        cbb1.ItemIndex:=-1;
        END;
      15:
       begin
        EditorSgrid_condition.cells[1,irow]:= cbb1.TEXT;
        EditorSgrid_condition.cells[2,irow]:=' and employ_type ='''+inttostr(integer(cbb1.Items.Objects[cbb1.itemindex]))+'''   ';
        END;

      16:  //联系电话：
       begin
        EditorSgrid_condition.cells[1,irow]:= trim(self.edt_QryieldName.text);
     if rg_how.ItemIndex= 0   then
     EditorSgrid_condition.cells[2,irow]:=' and phone ='''+trim(self.edt_QryieldName.text)+'''   '
     else
      EditorSgrid_condition.cells[2,irow]:=' and phone like  '''+trim(self.edt_QryieldName.text)+'%''   ';
      edt_QryieldName.Clear;
     END;
     
      17:  //宿舍编号：
        begin
          EditorSgrid_condition.cells[1,irow]:= trim(self.edt_QryieldName.text);
       if rg_how.ItemIndex= 0   then
       EditorSgrid_condition.cells[2,irow]:=' and roomCode ='''+trim(self.edt_QryieldName.text)+'''   '
      else
      EditorSgrid_condition.cells[2,irow]:=' and roomCode like  '''+trim(self.edt_QryieldName.text)+'%''   ';
      edt_QryieldName.Clear;
        END;
         18:
         begin
           EditorSgrid_condition.cells[1,irow]:=cbb1.TEXT;
         if cbb1.ItemIndex=0 then
         EditorSgrid_condition.cells[2,irow]:=' and status =0  '
        else if cbb1.ItemIndex=1 then
        EditorSgrid_condition.cells[2,irow]:=' and status =1  '
        else if cbb1.ItemIndex=2 then
        EditorSgrid_condition.cells[2,irow]:=' and status =2  '  ;
        cbb1.ItemIndex:=-1;
            end;
           19: //出生月份
            begin
           EditorSgrid_condition.cells[1,irow]:=cbb_month.TEXT;
           EditorSgrid_condition.cells[2,irow]:=' and month(birthday) ='''+(self.cbb_month.text)+'''   ';
           cbb_month.ItemIndex:=-1;
            END;

          20: // 转正否：
            begin
            EditorSgrid_condition.cells[1,irow]:=cbb1.TEXT;
            if cbb1.ItemIndex=0 then
            EditorSgrid_condition.cells[2,irow]:=' and formal =0   '
            else if cbb1.ItemIndex=1 then
            EditorSgrid_condition.cells[2,irow]:=' and formal =1   '
            else if cbb1.ItemIndex=2 then
            EditorSgrid_condition.cells[2,irow]:=' and formal =2   '

             END;


        21:
       begin
        EditorSgrid_condition.cells[1,irow]:= cbb1.TEXT;
        EditorSgrid_condition.cells[2,irow]:=' and source ='''+inttostr(integer(cbb1.Items.Objects[cbb1.itemindex]))+'''   ';
        END;

  end;

 end;

procedure TFrmQry.btn2Click(Sender: TObject);
var
   i : integer;
begin

   if EditorSgrid_condition.RowCount <= 2 then exit;
  for i:=EditorSgrid_condition.Row to EditorSgrid_condition.RowCount-2 do
   EditorSgrid_condition.Rows[i].Text:=EditorSgrid_condition.Rows[i+1].Text;
  EditorSgrid_condition.RowCount:=EditorSgrid_condition.RowCount-1;
end;


procedure TFrmQry.btn_ReSetClick(Sender: TObject);
var
   i : byte;
begin
  for i:=1 to EditorSgrid_condition.RowCount-2  do
  begin
     self.EditorSgrid_condition.Rows[i].Clear;
  end;
   self.EditorSgrid_condition.rowcount:=2;



end;




end.
