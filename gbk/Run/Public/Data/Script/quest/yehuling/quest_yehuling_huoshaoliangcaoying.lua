--�����ܾ�

--�ɼ�˼��

--�ű���
x207020_g_ScriptId = 207020

--��һ�������ID
x207020_g_MissionIdPre =12

--�����
x207020_g_MissionId = 21

--����Ŀ��npc
x207020_g_Name	="����" 

--���漸���Ƕ�̬��ʾ�����ݣ������������б��ж�̬��ʾ�������**********************

--������Ҫ����Ʒ
--x207020_g_DemandItem = {{id=10400001,num=1}}

--������Ҫ�ύ����Ʒ
--x207020_g_DeleteItem = {{id=10400001,num=1}}

--���񷢷ŵ���Ʒ
--x207020_g_MissionItem = {{id=10400001,num=1}}

--������Ҫɱ���Ĺ�
x207020_g_DemandKill ={{id=4002,num=1}}	

--�����Ƕ�̬**************************************************************

--�����ı�����
x207020_g_MissionName="��������Ӫ"
x207020_g_MissionInfo="����δ�����������У����Ǳ�֮��ơ�Ҫ���Ӯս�������뱣֤��������ݡ���ͨ���������ҵõ��ܱ�����70��170�����ǽ��������Ӫ�����￴�ص�����Ȼ���࣬���Ǹ�������ǧ����һ�ĸ��֣�������Ѧ������ֻҪ�����ܰ�����Ӫ�����ˣ������ս��Ҳ�������"  --��������
x207020_g_MissionTarget="ɱ��Ѧ����������ȼ3�ѽ��������"		--����Ŀ��
x207020_g_ContinueInfo="�����Ȼ�������������ǵ��䵶Ҳ����������ж�������������"		--δ��������npc�Ի�
x207020_g_MissionComplete="����������Ӫ���������ˣ�����͵��ź�������ɣ�������������"					--�������npc˵���Ļ�
--x207020_g_MissionAddItem="�õ������ܱ�"		
--x207020_g_szBackageFull = "����������"
--������
x207020_g_MoneyBonus=20000
x207020_g_ItemBonus={{id=12040002,num=1}}
x207020_g_RadioItemBonus={{id=12010001,num=1},{id=12020001,num=1}}
x207020_g_ExpBonus = 1000


--**********************************

--������ں���

--**********************************

function x207020_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207020_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207020_g_MissionId) > 0 then
	        if x207020_CheckSubmit(sceneId, selfId, targetId) <= 0 then
		     BeginEvent(sceneId)
		     AddText(sceneId,x207020_g_ContinueInfo) 
		     EndEvent()
		     local bDone = x207020_CheckSubmit(sceneId, selfId, targetId)
		     DispatchMissionDemandInfo(sceneId, selfId, targetId, x207020_g_ScriptId, x207020_g_MissionId, bDone)
	        end
	        if x207020_CheckSubmit(sceneId, selfId, targetId) > 0 then
		     --�ύ����ʱ��˵����Ϣ
                	BeginEvent(sceneId)
                	
                	AddText(sceneId, x207020_g_MissionName)
                        AddText(sceneId,x207020_g_MissionComplete)
                        AddMoneyBonus(sceneId, x207020_g_MoneyBonus)
                        for i, item in pairs(x207020_g_ItemBonus) do
                	AddItemBonus(sceneId, item.id, item.num)
                	for i, item in pairs(x207020_g_RadioItemBonus) do
                	AddRadioItemBonus(sceneId, item.id, item.num)
                	end
                	end
                        EndEvent()
                
                	DispatchMissionContinueInfo(sceneId, selfId, targetId, x207020_g_ScriptId, x207020_g_MissionId)

	        end
		
        elseif x207020_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
			
		x888888_PrintInfo(sceneId, x207020_g_MissionName, x207020_g_MissionInfo, x207020_g_MissionTarget, x207020_g_ItemBonus, x207020_g_MoneyBonus)

		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207020_g_ScriptId, x207020_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207020_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207020_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207020_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207020_g_ScriptId, x207020_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207020_CheckAccept(sceneId, selfId, targetId)

	if IsMissionHaveDone(sceneId, selfId, x207020_g_MissionIdPre) > 0 then
	    return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207020_CheckPushList(sceneId, selfId, targetId)
        if IsMissionHaveDone(sceneId, selfId, x207020_g_MissionIdPre) > 0 then
                    return 1
        end
	return 0
	
end

--**********************************

--����

--**********************************

function x207020_OnAccept(sceneId, selfId)

	--������������б�
	BeginEvent(sceneId)
	AddMission( sceneId, selfId, x207020_g_MissionId, x207020_g_ScriptId, 1, 0, 0)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207020_g_MissionId)
	SetMissionByIndex(sceneId,selfId,misIndex,0,0)		--�������
	SetMissionByIndex(sceneId,selfId,misIndex,1,0)
end



--**********************************

--����

--**********************************

function x207020_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207020_g_MissionId)

end






--**********************************

--����Ƿ�����ύ

--**********************************

function x207020_CheckSubmit( sceneId, selfId, targetId)

	if IsHaveMission(sceneId, selfId, x207020_g_MissionId) >= 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x207020_g_MissionId)
	     if (GetMissionParam(sceneId,selfId,misIndex,0)==1) then
	        if (GetMissionParam(sceneId,selfId,misIndex,1)==3) then
		return 1
		end
	     end
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207020_OnSubmit(sceneId, selfId, targetId, selectRadioId)
 
        if x207020_CheckSubmit( sceneId, selfId, selectRadioId ) then            
    	BeginAddItem(sceneId)                                                    
			for i, item in pairs(x207020_g_ItemBonus) do                    
				AddItem( sceneId,item.id, item.num )             
			end                                                      
			for i, item in pairs(x207020_g_RadioItemBonus) do               
				if item.id == selectRadioId then                 
					AddItem( sceneId,item.id, item.num )     
				end                                              
			end                                                      
		ret = EndAddItem(sceneId,selfId)                                 
		--���������                                                   
		if ret > 0 then                                                  
		  ret = DelMission( sceneId, selfId, x207020_g_MissionId ) 
			if ret > 0 then                                   
				MissionCom( sceneId,selfId, x207020_g_MissionId )
				               
				AddExp(sceneId, selfId, x207020_g_ExpBonus)   
	                        AddMoney(sceneId, selfId, x207020_g_MoneyBonus)
	                        AddItemListToHuman(sceneId,selfId)
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
	     
end


                                                                                                 
function x207020_OnKillObject(sceneId, selfId, objdataId)                                        
         if objdataId == x207020_g_DemandKill[1].id then 
         misIndex = GetMissionIndexByID(sceneId,selfId,x207020_g_MissionId)                                        
         num = GetMissionParam(sceneId,selfId,misIndex,0)                                        
             if num<=0  then                                                                     
             BeginEvent(sceneId)                                                                 
             SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)                                  
	     strText = "��ɱ��Ѧ����   1/1"
	     AddText(sceneId, strText) 
             EndEvent()
	   DispatchMissionTips(sceneId, selfId)
             end
         end
end                    




--**********************************

--���������¼�

--**********************************

function x207020_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207020_OnItemChanged(sceneId, selfId, itemdataId)

end

