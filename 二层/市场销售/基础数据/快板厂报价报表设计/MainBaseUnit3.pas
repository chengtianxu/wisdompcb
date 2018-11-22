unit MainBaseUnit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseUnit1, ExtCtrls, StdCtrls, Buttons, Grids, DBGridEh, Mask,
  DBCtrls, ComCtrls, Menus, DB, ADODB, math ;

type
  TBaseForm3 = class(TBaseForm1)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    BitBtn9: TBitBtn;
    BitBtn4: TBitBtn;
    SpeedButton4: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    PopupMenu1: TPopupMenu;
    PopupMenuN1: TMenuItem;
    PopupMenuN2: TMenuItem;
    PopupMenuN3: TMenuItem;
    Panel3: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    ADOStoredProc1: TADOStoredProc;
    N1: TMenuItem;
    popupN6: TMenuItem;
    N3: TMenuItem;
    ADOQuery1: TADOQuery;
    ADO274: TADOQuery;
    PopupMenuN4: TMenuItem;
    PopupMenuN5: TMenuItem;
    popupN7: TMenuItem;
    PopupMenuN8: TMenuItem;
    BitBtn6: TBitBtn;
    PopupMenu2: TPopupMenu;
    N2: TMenuItem;
    ADOQuery2: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
                                      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
                                     Column: TColumnEh);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure PopupMenuN2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Edit3Exit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure PopupMenuN3Click(Sender: TObject);
    procedure popupN6Click(Sender: TObject);
    procedure PopupMenuN4Click(Sender: TObject);
    procedure PopupMenuN5Click(Sender: TObject);
    procedure popupN7Click(Sender: TObject);
    procedure PopupMenuN8Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
    user_ptrs,vprevs,db_ptrs:string;
    hMapFile: THandle;
    MapFilePointer: Pointer;
    function addTnumber2():string;
    function addQNumber_1(CONST VALUE:INTEGER):BOOLEAN;
    procedure MenuItemClick(Sender: TObject);

    procedure update_04(v_seed: string);
  public
    { Public declarations }
  end;

var
  BaseForm3: TBaseForm3;

implementation
uses
  DMUnit1,EditBaseUnit2,IF_Unit1,AuditInfoUnit2
  ;
{$R *.dfm}

procedure TBaseForm3.FormShow(Sender: TObject);
var
  vn2:TMenuItem;
  i : integer;
begin
  inherited;
  {  }

  if user_ptrs = '' then user_ptrs := '550' ;
  if vprevs='' then vprevs := '4';
  //user_ptrs := '183' ;


  {

  //showmessage(db_ptrs);
  //if dm.ADOConnection1.Connected then
  //    dm.ADOConnection1.Close ;

  if not dm.ADOConnection1.Connected then
      begin
           if trim(vprevs)='' then
               begin
                   showmessage('请在主程序中打开此程序');
                   close;
               end;
           dm.adoconnection1.ConnectionString := db_ptrs;

           try
               if db_ptrs <> '' then
                    dm.Adoconnection1.Connected := true;
           except
               showmessage('连接错，请打开主程序');
               close;
               //application.Terminate;
           end;
      end
  ELSE
      BEGIN
          showmessage('连接出错，请与程序员联系!');
          CLOSE;
      END;
  if vprevs = '' then
      begin
          showmessage('权限为空，请在主程序中打开程序!');
          close;
      end;
  {}
  //最大化窗体
  SELF.WindowState :=wsMaximized;
  self.KeyPreview := true ;


  for i:=0 to DBGridEh1.Columns.Count-1 do
      begin
          vn2:=TMenuItem.Create(PopupMenu2) ;
          vn2.Name :=trim(DBGridEh1.Name)+'_'+inttostr(i);
          vn2.Caption := DBGridEh1.Columns[i].Title.Caption;
          vn2.OnClick := MenuItemClick;
          vn2.Checked :=true;
          PopupMenu2.Items.Add(vn2) ;
      end;

  { for i:=1 to dbgrid1.FieldCount do
   begin
   item:=TmenuItem.Create(self);
   item.Caption:=dbgrid1.Columns[i-1].Title.Caption;
   if dbgrid1.Columns[i-1].Visible then
    item.Checked:=true;
   item.OnClick:=item_click;
   self.PopupMenu2.Items.Add(item);
  end; {}

  if vprevs = '4' then
       n2.Enabled := true ;
end;

procedure TBaseForm3.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if Panel2.Visible then
      Panel2.Visible := false
  else
      Panel2.Visible := true ;
end;

procedure TBaseForm3.BitBtn5Click(Sender: TObject);
begin
  inherited;
  Panel2.Visible := false
  
end;

procedure TBaseForm3.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TBaseForm3.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  if not (gdFixed in State) then
       DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);
end;

procedure TBaseForm3.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;

  if not DBGridEh1.DataSource.DataSet.Active then exit;
  //如果只有一条记录不存在排序的问题
  if dm.qwzpr85_1.RecordCount <= 1 then exit;
       TitleBtnSort1(sender,acol,column,dm.qwzpr85_1,1);
  {}
end;

procedure TBaseForm3.FormCreate(Sender: TObject);
var
 ZAppName: array[0..127] of char;
 s,title_name:string;
 Found: HWND;
 vprog:pchar;
begin
  inherited;
  hMapFile := CreateFileMapping ($FFFFFFFF,nil,page_ReadWrite,0,100,'xyz2055coimasp20');
  MapFilePointer := MapViewOfFile(hMapFile,File_Map_All_Access,0,0,0);
  S := PChar(MapFilePointer);
  user_ptrs := trim(copy(S,3,pos(' ',s)-3));  //用户指针0005
  vprevs := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1));//权限 1:只读不帶銀碼 ; 2:可写不帶銀碼 ; 3:只读+银码 ; 4:可写+银码
  db_ptrs := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s))); //数据库连接串


  title_name:=application.Title;
  self.Caption:='' ;
  application.Title:='OnlyOne'+ IntToStr(HInstance);
  vprog:=pchar(title_name) ;
  strpcopy(ZAppName,vprog) ;
  Found := FindWindow(nil,ZAppName) ;

  if Found <> 0 then
     begin
        ShowWindow(Found, SW_SHOWMINIMIZED) ;
        ShowWindow(Found, SW_SHOWNORMAL) ;
        application.Terminate ;
     end ;

  application.Title := title_name ;
  self.Caption:=title_name ;
  DateSeparator := '-' ;
  ShortDateFormat := 'yyyy-mm-dd' ;
end;

procedure TBaseForm3.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  self.DbgridEHToExcel2(DBGridEh1,'报价单表');
end;

procedure TBaseForm3.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //showmessage('2');
  if key=#13 then
      if  not (Activecontrol is TdbgridEh) then
          if  not (Activecontrol is Tdbmemo) then
              //if  not (Activecontrol is Tdbmemo) then
                  begin { 不是在TDbgrid控件内}
                        perform(wm_nextdlgctl,0,0);{移动到下一个控件}
                        key:=#0;
                  end;
end;

procedure TBaseForm3.PopupMenuN2Click(Sender: TObject);
var
  vi:integer;
  //EditBaseForm2: TEditBaseForm2 ;
begin
  inherited;
  if not dm.qwzpr85_1.Active then exit ;
  if dm.qwzpr85_1.IsEmpty then exit ;

  if dm.qwzpr85_1AUDITED_STATUS.Value in [1,2,3] then
      begin
          messagedlg('该报价格单已经审批，不能修改！',mtinformation,[mbok,mbNo],0);
          exit;
      end;
  EditBaseForm2 := TEditBaseForm2.Create(application) ;
  //向数据库中增加一条记录
  EditBaseForm2.EditMode := 1 ;
  vi := dm.qwzpr85_1RKEY.Value  ;
  EditBaseForm2.RkeyData0085 := vi ;
  try
      EditBaseForm2.ShowModal ;
  finally
      EditBaseForm2.Free ;
  end ;

  {
  if dm.qwzpr85_1.Active then
      dm.qwzpr85_1.Refresh
  else
      begin
         dm.qwzpr85_2.Open ;
         dm.qwzpr85_3.Open ;
         dm.qwzpr85_1.Open ;
      end;
  {}
end;

procedure TBaseForm3.BitBtn3Click(Sender: TObject);
var
  i:integer;
begin
  inherited;
  If_Form1:= TIf_Form1.Create(application) ;
  try
       if If_Form1.ShowModal=mrok then
           begin
                if dm.qwzpr85_1.Active then dm.qwzpr85_1.Close;
                //if dm.qwzpr85_2.Active then dm.qwzpr85_2.Close;
                //if dm.qwzpr85_3.Active then dm.qwzpr85_3.Close;
                //if dm.qwzpr85_4.Active then dm.qwzpr85_4.Close;
                //if dm.qwzpr85_5.Active then dm.qwzpr85_5.Close;
                //if dm.qwzpr85_6.Active then dm.qwzpr85_6.Close;




                {不调用If_Form1时要使用
                dm.qwzpr85_1.Parameters.ParamValues['@vdate1'] := DateTimePicker1.Date ;
                dm.qwzpr85_1.Parameters.ParamValues['@vdate2'] := DateTimePicker2.Date ;
                dm.qwzpr85_1.Parameters.ParamValues['@CUST_PART_NO'] := trim(edit2.Text)+'%';
                dm.qwzpr85_1.Parameters.ParamValues['@tnumber'] := trim(edit1.Text)+'%';
                dm.qwzpr85_1.Parameters.ParamValues['@CUST_NAME'] := trim(edit4.Text)+'%';
                dm.qwzpr85_1.Parameters.ParamValues['@CUSTOMER_PART_NUMBER'] := trim(edit3.Text)+'%';
                dm.qwzpr85_1.Parameters.ParamValues['@EMPLOYEE_NAME'] := trim(edit5.Text)+'%';
                {}

                dm.qwzpr85_1.Parameters.ParamValues['@vdate1'] := FormatDateTime('yyyy-MM-dd',If_Form1.DateTimePicker1.Date)
                                                                    +' '+FormatDateTime('HH:MM:SS',If_Form1.DateTimePicker3.Time);
                dm.qwzpr85_1.Parameters.ParamValues['@vdate2'] := FormatDateTime('yyyy-MM-dd',If_Form1.DateTimePicker2.Date)
                                                                    +' '+FormatDateTime('HH:MM:SS',If_Form1.DateTimePicker4.Time);

                dm.qwzpr85_1.Parameters.ParamValues['@CUST_PART_NO'] := '%';
                dm.qwzpr85_1.Parameters.ParamValues['@tnumber'] := '%';
                dm.qwzpr85_1.Parameters.ParamValues['@CUST_NAME'] := '%';
                dm.qwzpr85_1.Parameters.ParamValues['@CUSTOMER_PART_NUMBER'] := '%';
                dm.qwzpr85_1.Parameters.ParamValues['@EMPLOYEE_NAME'] := '%';
                for i :=1 to If_Form1.sgrid1.RowCount-2 do
                    begin
                        dm.qwzpr85_1.Parameters.ParamValues[trim(If_Form1.sgrid1.Cells[2,i])] := trim(If_Form1.sgrid1.Cells[1,i])+'%';
                    end;
                //showmessage('1  '+db_ptrs);
                //showmessage('2  '+ dm.qwzpr85_1.Connection.ConnectionString);
                dm.qwzpr85_1.Prepared ;
                dm.qwzpr85_1.Open ;
                //showmessage(db_ptrs);

                dm.qwzpr85_2.Open ;
                dm.qwzpr85_3.Open ;
                dm.qwzpr85_4.Open ;
                dm.qwzpr85_5.Open ;
                dm.qwzpr85_6.Open ;

           end;
  finally
       If_Form1.Free ;
  end ;
end;

procedure TBaseForm3.BitBtn1Click(Sender: TObject);
begin
  inherited;
  Edit1.Text :='';
  Edit2.Text :='';
  Edit3.Text :='';
  Edit4.Text :='';
  Edit5.Text :='';
end;

function TBaseForm3.addTnumber2: string;
var
  v1,j1:integer; // ,vrec
  vseed,vseed0,vseed1:string;
begin
  //向数据库中增加一条记录
  dm.Adoquery3.Close;
  dm.Adoquery3.open;
  if not dm.Adoquery7.Active then
       dm.Adoquery7.open;

  Vseed1:=dm.Adoquery3.Fieldbyname('tnumber').asstring;
  {
  if trim(vseed1)='' then  vseed1:=dm.Adoquery7.fieldbyname('seed_value').asstring;
  try
    if strtoint(copy(trim(vseed1),length(trim(vseed1))-3,4))>=0 then;
         vseed0:='';
    v1:=0;
    for j1:=length(trim(vseed1)) downto 1 do
      begin
        try
          if strtoint(copy(trim(vseed1),j1,1))>0 then;
        except
          v1:=1;
          break;
        end;
      end;
    if v1=0 then j1:=0;

    vseed0:=copy(trim(vseed1),1,j1);
    vseed:=copy(trim(vseed1),j1+1,Length(trim(vseed1))-j1);
    vseed:=copy(trim(inttostr(strtoint(vseed)+10000000000+1)),11-length(trim(vseed))+1,length(trim(vseed)));
    Vseed1:=vseed0+vseed;
  except
    Vseed1:='';
  end;   {}
  result := Vseed1 ;
end;

procedure TBaseForm3.Edit3Exit(Sender: TObject);
begin
  inherited;
  BitBtn3Click(sender);
end;

procedure TBaseForm3.Edit2Exit(Sender: TObject);
begin
  inherited;
  BitBtn3Click(sender);
end;

procedure TBaseForm3.Edit1Exit(Sender: TObject);
begin
  inherited;
  BitBtn3Click(sender);
end;

procedure TBaseForm3.Edit4Exit(Sender: TObject);
begin
  inherited;
  BitBtn3Click(sender);
end;

procedure TBaseForm3.Edit5Exit(Sender: TObject);
begin
  inherited;
  BitBtn3Click(sender);
end;

procedure TBaseForm3.DateTimePicker1Exit(Sender: TObject);
begin
  inherited;
  BitBtn3Click(sender);
end;

procedure TBaseForm3.DateTimePicker2Exit(Sender: TObject);
begin
  inherited;
  BitBtn3Click(sender);
end;

procedure TBaseForm3.PopupMenuN3Click(Sender: TObject);
begin
  inherited;
  if dm.qwzpr85_1.IsEmpty then exit ;
  if dm.qwzpr85_1qby_empl_ptr.AsString <> user_ptrs then
      begin
          messagedlg('报价单只能由创建人本人删除，您不能删除！',mtinformation,[mbok],0);
          exit;
      end;

  if messagedlg('确认要删除该项报价档案吗？',mtconfirmation,[mbYes,mbNo],0)<>MrYes then exit;
  begin
      try
          dm.ADOConnection1.BeginTrans ;
          with ADOStoredProc1 do
              begin
                   if Active then close;
                   Parameters.Clear ;
                   ProcedureName := 'Qwzpr85;28';
                   Parameters.CreateParameter('@RETURN_VALUE',ftinteger,pdReturnValue,0,0) ;
                   Parameters.CreateParameter('@rkey0085',ftinteger,pdInput,0,0);
                   Parameters.ParamValues['@RETURN_VALUE'] := 0 ;
                   Parameters.ParamValues['@rkey0085'] := dm.qwzpr85_1rkey.Value ;
                   prepared;
                   ExecProc ;
              end ;
          dm.qwzpr85_1.Delete ;
          dm.qwzpr85_1.UpdateBatch();
          dm.ADOConnection1.CommitTrans ;
      except
          dm.ADOConnection1.RollbackTrans ;
          showmessage('删除出错');
      end ;
  end ;
end;

procedure TBaseForm3.popupN6Click(Sender: TObject);
var
   ranking :integer ;
begin
  inherited;
  APPLICATION.ProcessMessages ;
  with ADO274 do
      begin
           close;
           Parameters.ParamByName('vptr').Value := dm.qwzpr85_1rkey.AsInteger;
           open;
      end;
  while not ADO274.eof do ADO274.Delete;//如果该pr已有审批人员,删除原有审批人员

  with ADOQuery1 do
     begin
         close;
         sql.Clear;
         sql.Add('SELECT USER_PTR FROM Data0265');
         //sql.Add('WHERE (UPPER_LIMIT <=:total) AND (LOWER_LIMIT >= :total2)');
         //sql.Add(' and AUTH_GROUP_PTR = '+inttostr(dm.qwzpr85_1PROD_ROUTE_PTR.Value));
         sql.Add('WHERE AUTH_GROUP_PTR = '+inttostr(dm.qwzpr85_1PROD_ROUTE_PTR.Value));

         //sql.Add('ORDER BY upper_LIMIT desc');
         //Parameters.ParamValues['total'] := dm.qwzpr85_1quote_price.AsFloat;
         //dm.qwzpr85_1
         //Parameters.ParamValues['total2'] := dm.qwzpr85_1quote_price.AsFloat;
         open;
     end;
  ranking:=1;
  if ADOQuery1.IsEmpty then //为空时全部参加审批
     with ADOQuery1 do
         begin
             close;
             sql.Clear;
             sql.Add('SELECT USER_PTR FROM Data0265');
             sql.Add(' where AUTH_GROUP_PTR = '+inttostr(dm.qwzpr85_1PROD_ROUTE_PTR.Value));
             //sql.Add('ORDER BY UPPER_LIMIT desc');
             open;
         end;

  dm.qwzpr85_1.Edit;
  dm.qwzpr85_1APPD_BY.AsInteger :=ADOQuery1.FieldValues['user_ptr'];//第一审批人;
  //dm.qwzpr85_1AUDITED_STATUS.Value := 1 ;
  dm.qwzpr85_1AUDITED_STATUS.Value := 1 ;  //审批中
  dm.qwzpr85_1.UpdateBatch;
  ADOQuery1.First ;
  while not ADOQuery1.Eof do
      begin
           ADO274.Append;
           ADO274.fieldbyname('qte_ptr').AsInteger := dm.qwzpr85_1rkey.AsInteger ;
           ADO274.FieldByName('user_ptr').AsInteger :=ADOQuery1.FieldValues['user_ptr'];
           ADO274.fieldbyname('ranking').AsInteger:=ranking;
           if ranking = 1 then
               ADO274.fieldbyname('auth_flag').AsString :='Y';

           ADO274.Post;
           inc(ranking);
           ADOQuery1.Next;
      end;
  ADOQuery1.Close;

end;

function TBaseForm3.addQNumber_1(const VALUE: INTEGER): BOOLEAN;
var
  oldvseed2,vseed2:string ;
  //EditBaseForm2: TEditBaseForm2 ;
begin
  result := false ;
  if not dm.qwzpr85_1.Active then exit ;
  EditBaseForm2 := TEditBaseForm2.Create(application) ;
  //向数据库中增加一条记录
  {dm.ADODate.Close ;
  dm.ADODate.Open ;
  //showmessage(Vseed1);
  //oldvseed2 := addTnumber2;

  if dm.ado04.Active then dm.ado04.Close ;
  dm.ado04.Open ;
  vseed2 := dm.ado04SEED_VALUE.Value ; 
  dm.ado04.Close;

  //dm.ADOConnection1.BeginTrans ;
  //try

      if dm.qwzpr85_2.Active then dm.qwzpr85_2.Close;
      if dm.qwzpr85_3.Active then dm.qwzpr85_3.Close;
      if dm.qwzpr85_4.Active then dm.qwzpr85_4.Close;
      if dm.qwzpr85_5.Active then dm.qwzpr85_5.Close;
      if dm.qwzpr85_6.Active then dm.qwzpr85_6.Close;
      dm.qwzpr85_1.Append ;
      dm.qwzpr85_1TNUMBER.Value := vseed2 ;
      dm.qwzpr85_1TTYPE.Value := VALUE ;
      dm.qwzpr85_1ENTER_DATE.Value := dm.ADODate.FieldValues['vdt'];

      dm.qwzpr85_1QBY_EMPL_PTR.Value := strtoint(self.user_ptrs) ;
      dm.qwzpr85_1ref_part_no.Value := '';
      dm.qwzpr85_1CUST_PART_NO.Value := '';
      dm.qwzpr85_1CUST_NAME.Value := '';
      DM.qwzpr85_1AUDITED_STATUS.Value  := 0 ;

      //dm.qwzpr85_1.UpdateBatch();
      //dm.qwzpr85_1.Refresh ;



      update_04(vseed2);
      //dm.ADOConnection1.CommitTrans ;
      dm.qwzpr85_2.Open ;
      dm.qwzpr85_3.Open ;
      dm.qwzpr85_4.Open ;
      dm.qwzpr85_5.Open ;
      dm.qwzpr85_6.Open ;
      //showmessage(dm.qwzpr85_1rkey.AsString );
  //except
  //    dm.ADOConnection1.RollbackTrans ;
  //    showmessage('新增记录出错');
  //    EditBaseForm2.Free ;
  //    exit ;
 // end; {}
  EditBaseForm2.EditMode := 0 ;
  EditBaseForm2.RkeyData0085 := 0;
  EditBaseForm2.vvmode  := VALUE ;
  EditBaseForm2.user_ptrs := user_ptrs ;
  try
      if EditBaseForm2.ShowModal=mrok then
         begin

         end ;
      if not dm.qwzpr85_2.Active then dm.qwzpr85_2.Open ;
      if not dm.qwzpr85_3.Active then dm.qwzpr85_3.Open ;
      if not dm.qwzpr85_4.Active then dm.qwzpr85_4.Open ;
      if not dm.qwzpr85_5.Active then dm.qwzpr85_5.Open ;
      if not dm.qwzpr85_6.Active then dm.qwzpr85_6.Open ;

         result := true ;
  finally
      EditBaseForm2.Free ;
  end ;
  
end;

procedure TBaseForm3.PopupMenuN4Click(Sender: TObject);
begin//新增报价
  inherited;
  if dm.qwzpr85_1.Active then
       addQNumber_1(2)
  else
     showmessage('请先按查询后再操作');
end;

procedure TBaseForm3.PopupMenuN5Click(Sender: TObject);
begin  //新增报价
  inherited;
  if dm.qwzpr85_1.Active then
      addQNumber_1(3) 
  else
      showmessage('请先按查询后再操作');
end;

procedure TBaseForm3.popupN7Click(Sender: TObject);
begin
  inherited;
  if dm.qwzpr85_1.Active then
      if not(dm.qwzpr85_1.IsEmpty) then
          begin
              AuditInfoForm2 := TAuditInfoForm2.Create(application) ;
              try
                  if AuditInfoForm2.Qwzpr85_30.Active then AuditInfoForm2.Qwzpr85_30.Close ;
                  AuditInfoForm2.Qwzpr85_30.Parameters.ParamValues['@rkey0085'] := dm.qwzpr85_1rkey.AsInteger;
                  AuditInfoForm2.Qwzpr85_30.Open ;
                  AuditInfoForm2.ShowModal ;
              finally
                   if AuditInfoForm2.Qwzpr85_30.Active then AuditInfoForm2.Qwzpr85_30.Close ;
                   AuditInfoForm2.Free ;
              end ;
          end ;
end;

procedure TBaseForm3.PopupMenuN8Click(Sender: TObject);
begin  //检查
  inherited;
  if not dm.qwzpr85_1.Active then exit ;
  if dm.qwzpr85_1.IsEmpty then exit ;

  EditBaseForm2 := TEditBaseForm2.Create(application) ;
  //向数据库中增加一条记录
  EditBaseForm2.EditMode := 2 ;
  EditBaseForm2.RkeyData0085 := dm.qwzpr85_1RKEY.Value ;
  try
      EditBaseForm2.ShowModal ;
  finally
      EditBaseForm2.Free ;
  end ;
end;

procedure TBaseForm3.PopupMenu1Popup(Sender: TObject);
begin
  inherited;
  if dm.qwzpr85_1.Active then
      begin
          PopupMenuN1.Enabled := true ;
          PopupMenuN2.Enabled := true ;
          PopupMenuN3.Enabled := true ;
          popupN6.Enabled := true ;
          if vprevs <> '' then
              begin
                  if (vprevs = '1') or (vprevs = '3') then
                     begin  //只有只读权限
                          PopupMenuN1.Enabled := false ;
                          PopupMenuN2.Enabled := false ;
                          PopupMenuN3.Enabled := false ;
                          popupN6.Enabled := false ;
                     end ;
              end;
          if dm.qwzpr85_1Audited_status.Value = 3 then
              begin  //已审核后的内容不能编辑删除
                   if  PopupMenuN2.Enabled = true then PopupMenuN2.Enabled := false ;
                   if  PopupMenuN3.Enabled = true then PopupMenuN3.Enabled := false ;
                   if vprevs = '4' then
                        n2.Enabled := true ;
              end
          ELSE if dm.qwzpr85_1Audited_status.Value = 1 then
              begin  //已审核后的内容不能编辑删除
                   if vprevs = '4' then
                        n2.Enabled := true ;
              end
          else
              begin
                  n2.Enabled := false ;
              end ;
          if dm.qwzpr85_1Audited_status.Value > 0  then
              begin
                   if  popupN6.Enabled = true then popupN6.Enabled := false ;
              end ;


      end ;

end;

procedure TBaseForm3.MenuItemClick(Sender: TObject);
var
 i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i:=0 to DBGridEh1.FieldCount-1 do
              if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
                 begin
                    DBGridEh1.Columns[i].Visible:=true;
                    break;
                 end;
      end
  else
     begin
        for i:=0 to DBGridEh1.FieldCount-1 do
          if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
             begin
                DBGridEh1.Columns[i].Visible:=false;
                break;
             end;
     end;
end;

procedure TBaseForm3.BitBtn6Click(Sender: TObject);
begin
  inherited;
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);

end;

procedure TBaseForm3.update_04(v_seed: string);
var
  i,v_length:integer;
  v_last,new_seed:string;
begin
  v_length := length(v_seed);
  if dm.ado04.Active then dm.ado04.Close ;
  dm.ado04.Open ;

  for i := v_length downto 1 do
      if not (v_seed[i] in ['0'..'9']) then
           begin
                v_last := floattostr(power(10,v_length-1)+strtofloat(copy(v_seed,i+1,v_length-i))+1);
                new_seed := copy(v_seed,1,i)+copy(v_last,i+1,v_length-i);
                
                dm.ado04.Edit;
                dm.ado04SEED_VALUE.Value := new_seed;

                dm.ado04.Post;

                break;
           end
      else
           if i=1 then
              begin
                 v_last := floattostr(power(10,v_length)+strtofloat(v_seed)+1);
                 new_seed := copy(v_last,2,v_length);

                 dm.ado04.Edit;
                 dm.ado04SEED_VALUE.Value := new_seed;

                 dm.ado04.Post;
                 
              end;
  dm.ado04.Close ;
end;

procedure TBaseForm3.N2Click(Sender: TObject);
begin  //反审核
  inherited;
  if vprevs = '4' then
      begin
          dm.ADOConnection1.BeginTrans ;
          try
               if ADOQuery2.Active then ADOQuery2.Close;
               ADOQuery1.SQL.Clear ;
               ADOQuery1.SQL.Add('delete data0274 where qte_ptr = :rkey85') ;
               ADOQuery1.Parameters.ParamValues['rkey85'] := dm.qwzpr85_1rkey.Value ;
               ADOQuery1.Prepared ;
               ADOQuery1.ExecSQL  ;


               dm.qwzpr85_1.Edit ;
               dm.qwzpr85_1AUDITED_STATUS.Value := 0 ;

               dm.qwzpr85_1.UpdateBatch();


               dm.ADOConnection1.CommitTrans ;
          except
               dm.ADOConnection1.RollbackTrans ;
          end;
      end
  else
      begin
          showmessage('你无权反审核');
      end ;
end;

end.
