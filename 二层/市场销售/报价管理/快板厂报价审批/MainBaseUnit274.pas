unit MainBaseUnit274;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseUnit1, Grids, DBGridEh, Menus, Buttons, StdCtrls, ToolWin,
  ComCtrls, ExtCtrls, DB, ADODB;

type
  TMainBaseForm274 = class(TBaseForm1)
    ToolBar1: TToolBar;
    BitBtn6: TBitBtn;
    SpeedButton4: TSpeedButton;
    SpeedButton2: TSpeedButton;
    PopupMenu2: TPopupMenu;
    DBGridEh1: TDBGridEh;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    RadioGroup1: TRadioGroup;
    ToolButton1: TToolButton;
    ADOQuery1: TADOQuery;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    { Private declarations }
    _sql : string ;
    user_ptrs,vprevs,db_ptrs:string;
    user_ptrs73:integer;//返回73的数据
    hMapFile: THandle;
    MapFilePointer: Pointer;

    procedure MenuItemClick(Sender: TObject);

    function getDate():string; //获取服务器时间
  public
    { Public declarations }
  end;

var
  MainBaseForm274: TMainBaseForm274;

implementation
uses
   DMUnit1,EditBaseUnit2,AuditInfoUnit2;
{$R *.dfm}

procedure TMainBaseForm274.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  //showmessage('2');
  if key=#13 then
      if  not (Activecontrol is TdbgridEh) then
          //if  not (Activecontrol is Tdbmemo) then
              //if  not (Activecontrol is Tdbmemo) then
                  begin { 不是在TDbgrid控件内}
                        perform(wm_nextdlgctl,0,0);{移动到下一个控件}
                        key:=#0;
                  end;
end;

procedure TMainBaseForm274.FormCreate(Sender: TObject);
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
  //showmessage(user_ptrs+'  : '+s);


  {//csi_empl_ptr.Caption := trim(copy(S,1,pos(' ',s)));
   //vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1)); //权限
  //db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s))); //那一个数据库
  }
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

procedure TMainBaseForm274.FormShow(Sender: TObject);
var
  vn2:TMenuItem;
  i : integer;
begin
  inherited;

  {
  if user_ptrs = '' then user_ptrs := '466' ;
  if vprevs='' then vprevs := '4';
  {}

  //user_ptrs := '183' ;


  //showmessage(db_ptrs);
  //if dm.ADOConnection1.Connected then
  //    dm.ADOConnection1.Close ;
  //showmessage('1:'+db_ptrs);
  if not dm.ADOConnection1.Connected then
      begin
           if trim(vprevs)='' then
               begin
                   showmessage('请在主程序中打开此程序');
                   close;
               end;
           dm.adoconnection1.ConnectionString := db_ptrs;
           //showmessage('2:'+db_ptrs);
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

  if user_ptrs <> '' then
      begin
          if ADOQuery1.Active  then ADOQuery1.Close ;
          ADOQuery1.SQL.Clear ;
          ADOQuery1.SQL.Add('select rkey from data0073 where employee_ptr= :employee_ptr');
          ADOQuery1.Parameters.ParamValues['employee_ptr'] := strtoint(user_ptrs);
          ADOQuery1.Open ;
          user_ptrs73 := ADOQuery1.FieldValues['rkey'];
          ADOQuery1.Close ;
      end;

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

  _sql:=dm.DS85.CommandText;
  RadioGroup1Click(nil);
  dm.ds85.Open;
end;

procedure TMainBaseForm274.MenuItemClick(Sender: TObject);
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

procedure TMainBaseForm274.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  close ;
end;

procedure TMainBaseForm274.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  self.DbgridEHToExcel2(DBGridEh1,'报价单表');
end;

procedure TMainBaseForm274.PopupMenu1Popup(Sender: TObject);
begin
  inherited;

 if DBGridEh1.SelectedRows.Count >1 then exit;

 if trim(dm.ds85auth_flag.value)<>'Y' then
     N1.Enabled:=false
 else
     N1.Enabled:=true;

 if trim(dm.ds85auth_flag.value)<>'Y' then
     begin
         if RadioGroup1.ItemIndex = 1 then
             N2.Enabled:=true ;
     end
 else
     N2.Enabled:=false;

end;

procedure TMainBaseForm274.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  dm.ds85.Close;
  if RadioGroup1.ItemIndex=0 then
      begin
         dm.DS85.CommandText:=_sql+' and (Data0274.auth_flag = '''+'Y'+''')'+#13
                           +' and (Data0085.AUDITED_STATUS = 1)';
         dm.ds85.Parameters.ParamValues['rkey73'] :=  user_ptrs73;//strtoint(user_ptrs);
      end
  else
      begin
         dm.DS85.CommandText:=_sql;
         dm.ds85.Parameters.ParamValues['rkey73'] := user_ptrs73 ;//strtoint(user_ptrs);
      end;
  dm.ds85.Open;
end;

procedure TMainBaseForm274.BitBtn6Click(Sender: TObject);
begin
  inherited;
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMainBaseForm274.N7Click(Sender: TObject);
begin
  inherited ;
  RadioGroup1Click(sender) ;
end;

function TMainBaseForm274.getDate: string;
begin
  DM.Qery.Close ;
  dm.Qery.SQL.Clear ;
  dm.Qery.SQL.Text :='select getdate() as dt';
  DM.Qery.OPEN;
  result:= datetimetostr(dm.Qery.Fieldbyname('dt').Value);
end;

procedure TMainBaseForm274.N1Click(Sender: TObject);
begin
 if dm.DS85auth_flag.Value='Y' then
  try
   dm.ADOConnection1.BeginTrans;
   dm.DS85.Edit;
   dm.DS85auth_flag.Value:='N';                 //78
   dm.DS85auth_date.Value := strtodatetime(getDate);//getsystem_date(dm.adoquery1,0);   // 授权日期服务器时间78

   dm.ads274.Close;

   dm.ads274.Parameters.ParamValues['rkey85'] := dm.DS85RKEY.Value ;

   dm.ads274.Open;
   dm.ads274.First ;
   //showmessage('a:  '+dm.ads274ranking.AsString +' : '+dm.ds85ranking.AsString );
   //if not dm.ads274.Eof then
   //     begin
            while not dm.ads274.Eof do
                begin
                   //showmessage('abcd:  '+dm.ads274ranking.AsString +' : '+dm.ds85ranking.AsString );
                   if dm.ads274ranking.Value - dm.ds85ranking.Value = 1 then
                      begin               //给下一个审批用户赋值


                       dm.ads274.Edit;
                       dm.ads274auth_flag.Value:='Y';
                       dm.ads274.Post;

                       //showmessage(inttostr(dm.ads274.RecordCount));


                       break;

                      end
                   else
                      begin
                         //showmessage('else:   '+ inttostr(dm.ads274.RecNo)+'  '+inttostr(dm.ads274.RecordCount));
                         if dm.ads274.RecNo = dm.ads274.RecordCount then//如果是最后一条记录
                            dm.ds85audited_status.Value := 3;//表示报价已经完成审批
                      end ;
                   dm.ads274.Next;
                end;

      //   end ;
     //else
     //    begin
     //         dm.ds85audited_status.Value := 3;//表示报价已经完成审批
     //    end ;
     dm.DS85.Post;
     dm.ADOConnection1.CommitTrans;
   except
    dm.ADOConnection1.RollbackTrans;
    messagedlg('审批操作不成，请退出后再来一次',mtinformation,[mbok],0);
    dm.Ds85.Close;
    dm.Ds85.Open;
   end
  else
   messagedlg('审批不成功，当前审批人不是您！',mterror,[mbcancel],0);
end;

procedure TMainBaseForm274.N2Click(Sender: TObject);
begin  //取消审核
 try                  //如果已全部审批那么变成待审批状态
  dm.ADOConnection1.BeginTrans;
  dm.Ds85.Edit;
  dm.Ds85auth_date.AsVariant := null;   // 取消审批
  dm.Ds85auth_flag.Value:='Y';
  if dm.Ds85audited_status.Value = 3 then
   dm.Ds85audited_STATUS.Value := 1;

   dm.Ds85.Post;

   dm.ads274.Close;
   dm.ads274.Parameters.ParamValues['rkey85'] := dm.DS85RKEY.Value ;
   dm.ads274.Open;
   while not dm.ads274.Eof do
    begin
     if dm.ads274ranking.Value-dm.ds85ranking.Value = 1 then
      begin               //给下一个审批用户赋值
       dm.ads274.Edit;
       dm.ads274auth_flag.Value:='N';
       dm.ads274.Post;
       break;
      end;
     dm.ads274.Next;
    end;
    dm.ADOConnection1.CommitTrans;
   except
    dm.ADOConnection1.RollbackTrans;
    messagedlg('取消审批操作不成，请退出后再来一次',mtinformation,[mbok],0);
    dm.Ds85.Close;
    dm.Ds85.Open;
   end;
end; //取消审核

procedure TMainBaseForm274.N3Click(Sender: TObject);
var
 str:string;
begin
if messagedlg('退回报价员操作是不可逆操作,你确定吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
 str := InputBox(dm.DS85TNUMBER.Value,'退回原因','');

 if trim(str)<>'' then
 begin
 dm.DS85.Edit;
 dm.DS85AUDITED_STATUS.Value:=4;
 dm.DS85apprv_date.Value := strtodatetime(getDate);//getsystem_date(dm.adoquery1,0);//退回日期
 //openquery(dm.ADOQuery1,'select EMPLOYEE_PTR from data0073 where rkey='+
 //                        csi_ptr.Caption);
 dm.DS85APPRV_BY_PTR.Value:= user_ptrs73;//dm.ADOQuery1.FieldValues['EMPLOYEE_PTR'];
 dm.DS85cust_add2.Value:=str;
 dm.DS85.Post;
 dm.DS85.Close;
 dm.DS85.Open;
 end
 else
 messagedlg('退回原因为空，退回操作不成',mtinformation,[mbok],0);
end;
end;//退回

procedure TMainBaseForm274.N5Click(Sender: TObject);
begin
  inherited;
  if not dm.DS85.Active then exit ;
  if dm.DS85.IsEmpty then exit ;

  EditBaseForm2 := TEditBaseForm2.Create(application) ;
  //向数据库中增加一条记录
  EditBaseForm2.EditMode := 3 ;
  try
      EditBaseForm2.ShowModal ;
  finally
      EditBaseForm2.Free ;
  end ;
end;

procedure TMainBaseForm274.N6Click(Sender: TObject);
begin
  inherited;
  AuditInfoForm2 := TAuditInfoForm2.Create(application) ;
  try
      if AuditInfoForm2.Qwzpr85_30.Active then AuditInfoForm2.Qwzpr85_30.Close ;
      AuditInfoForm2.Qwzpr85_30.Parameters.ParamValues['@rkey0085'] := dm.ds85rkey.AsInteger;
      AuditInfoForm2.Qwzpr85_30.Open ;
      AuditInfoForm2.ShowModal ;
  finally
       if AuditInfoForm2.Qwzpr85_30.Active then AuditInfoForm2.Qwzpr85_30.Close ;
       AuditInfoForm2.Free ;
  end ;
end;

end.
