--�����ܾ�

--�ɼ�˼��

--�ű���
x207017_g_ScriptId = 207017

--��һ�������ID
x207017_g_MissionIdPre =17

--�����
x207017_g_MissionId = 18

--����Ŀ��npc
x207017_g_Name	="����" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--������Ҫ����Ʒ
--x207017_g_DemandItem = {{id=10400001,num=1}}

--������Ҫ�ύ����Ʒ
--x207017_g_DeleteItem = {{id=10400001,num=1}}

--���񷢷ŵ���Ʒ
x207017_g_MissionItem = {{id=12090008,num=1}}

--������Ҫɱ���Ĺ�
x207017_g_DemandKill ={{id=4003,num=1}}	

--�����Ƕ�̬**************************************************************

--�����ı�����
x207017_g_MissionName="׷ɱ����"
x207017_g_MissionInfo="�󺹴����ˣ�Ұ�����������н���һ��նɱ����������Ϊ�˰�ο�ң���ȻҲ������ɱ�����Ѿ���ͨ�ˣ�����Ӫ�����飬��Ӧ��ǣ����Ұ������Щս�ܵķ�²�����ˮ�»����ţ�һ��Ҳ����ô�롣����ֻҪɱ����(33,71)һ���˾��㹻�ˣ����ܰ������Ҿ����ҵ�����"  --��������
x207017_g_MissionTarget="������ɱ������"		--����Ŀ��
x207017_g_ContinueInfo="������������"		--δ��������npc�Ի�
x207017_g_MissionComplete="����������ˣ��ҿ���������ͷ��һ��Ҳ���˲��������������ӣ�����Ҹо����Լ������Ѿ���ƽ���ˡ�"					--�������npc˵���Ļ�
x207017_g_MissionAddItem="������ͷ   1/1"		
x207017_g_szBackageFull = "����������"
--������
x207017_g_MoneyBonus=20000
x207017_g_ItemBonus={{id=12010001,num=1}}
x207017_g_RadioItemBonus={{id=12010001,num=1},{id=12010001,num=1}}
x207017_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207017_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207017_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207017_g_MissionId) > 0 then
	         if x207017_CheckSubmit(sceneId, selfId, targetId) <= 0 then
		     BeginEvent(sceneId)
		     AddText(sceneId,x207017_g_ContinueInfo)
		     AddText(sceneId,"��Ҫ��Ʒ") 
                     for i, item in x207017_g_MissionItem do  
		     AddItemBonus(sceneId, item.id, item.num)
		     EndEvent()
		     end
		     local bDone = x207017_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId, targetId, x207017_g_ScriptId, x207017_g_MissionId, bDone)
		 end
		 if x207017_CheckSubmit(sceneId, selfId, targetId) > 0 then
		     BeginEvent(sceneId)
		     AddText(sceneId, x207017_g_MissionName)
                     AddText(sceneId,x207017_g_MissionComplete)
                     AddMoneyBonus(sceneId, x207017_g_MoneyBonus)
                     for i, item in x207017_g_ItemBonus do
	             AddItemBonus(sceneId, item.id, item.num)
	             for i, item in x207017_g_RadioItemBonus do
	             AddRadioItemBonus(sceneId, item.id, item.num)
		     end
	             end
	             EndEvent()
	             DispatchMissionContinueInfo(sceneId, selfId, targetId, x207017_g_ScriptId, x207017_g_MissionId)

		 end
		
        elseif x207017_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207017_g_MissionName, x207017_g_MissionInfo, x207017_g_MissionTarget, x207017_g_ItemBonus, x207017_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207017_g_ScriptId, x207017_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207017_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207017_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207017_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207017_g_ScriptId, x207017_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207017_CheckAccept(sceneId, selfId, targetId)

	if IsMissionHaveDone(sceneId, selfId, x207017_g_MissionIdPre) > 0 then
	    return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207017_CheckPushList(sceneId, selfId, targetId)
        if IsMissionHaveDone(sceneId, selfId, x207017_g_MissionIdPre) > 0 then
                    return 1
        end
	return 0
	
end

--**********************************

--����

--**********************************

function x207017_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207017_g_MissionId, x207017_g_ScriptId, 1, 0, 0)
end



--**********************************

--����

--**********************************

function x207017_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207017_g_MissionId)

end



--**********************************

--����

--**********************************

function x207017_OnContinue(sceneId, selfId, targetId)

	--�ύ����ʱ��˵����Ϣ
	BeginEvent(sceneId)
	
	AddText(sceneId, x207017_g_MissionName)
        AddText(sceneId,x207017_g_MissionComplete)
        AddMoneyBonus(sceneId, x207017_g_MoneyBonus)
        for i, item in x207017_g_ItemBonus do
	AddItemBonus(sceneId, item.id, item.num)
	for i, item in x207017_g_RadioItemBonus do
	AddRadioItemBonus(sceneId, item.id, item.num)
		end
	end
        EndEvent()

	DispatchMissionContinueInfo(sceneId, selfId, targetId, x207017_g_ScriptId, x207017_g_MissionId)

end


--**********************************

--����Ƿ�����ύ

--**********************************

function x207017_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,12090008)==1 then
		return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207017_OnSubmit(sceneId, selfId, targetId, selectRadioId)
 
        if x207017_CheckSubmit( sceneId, selfId, selectRadioId ) then            
    	BeginAddItem(sceneId)                                                    
			for i, item in x207017_g_ItemBonus do                    
				AddItem( sceneId,item.id, item.num )             
			end                                                      
			for i, item in x207017_g_RadioItemBonus do               
				if item.id == selectRadioId then                 
					AddItem( sceneId,item.id, item.num )     
				end                                              
			end                                                      
		ret = EndAddItem(sceneId,selfId)                                 
		--���������                                                   
		if ret > 0 then                                                  
		  ret = DelMission( sceneId, selfId, x207017_g_MissionId ) 
			if ret > 0 then                                   
				MissionCom( sceneId,selfId, x207017_g_MissionId )
				AddExp(sceneId, selfId, x207017_g_ExpBonus)   
	                        AddMoney(sceneId, selfId, x207017_g_MoneyBonus)
	                        AddItemListToHuman(sceneId,selfId)
	                        for i, item in x207017_g_MissionItem do
			        DelItem(sceneId, selfId, item.id, item.num)
		                end
			end                                               
		else                                                             
		--������û�мӳɹ�                                             
			BeginEvent(sceneId)                                      
				AddText(sceneId,"��Ʒ����������������������");                        
			EndEvent(sceneId)                                        
			DispatchMissionTips(sceneId,selfId)                      
		end                                                              
	end                                                                      
	     EndEvent(sceneId)
	     DispatchMissionTips(sceneId,selfId)
	     
end


                                                                                                 
function x207017_OnKillObject(sceneId, selfId, objdataId)     
        if objdataId == x207017_g_DemandKill[1].id then
               if LuaFnGetItemCount(sceneId,selfId,12090008)==0 then
             x888888_DeleteAndAddItem(sceneId, selfId, nil, x207017_g_MissionItem, x207017_g_MissionAddItem, x207017_g_szBackageFull)   
             end
         end
end                    




--**********************************

--���������¼�

--**********************************

function x207017_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207017_OnItemChanged(sceneId, selfId, itemdataId)

end

