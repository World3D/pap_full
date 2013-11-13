--��ʿ֤��

--MisDescBegin
x205003_g_ScriptId = 205003
--x205003_g_MissionIdPre =42
x205003_g_MissionId = 43
x205003_g_MissionKind = 11
x205003_g_MissionLevel = 55
--x205003_g_ScriptIdNext = {ScriptId = 205004 ,LV = 1 }
x205003_g_Name	="�ٲ�̨" 
x205003_g_DemandItem ={{id=13010001,num=10}}
x205003_g_noDemandKill ={{id=303,num=1}}	

x205003_g_MissionName="��ʿ֤��"
x205003_g_MissionInfo="    ��λ��ʿ�����ţ������ˣ������ɹŵ۹���������һֱ���ڹ�̤�������ǵ����ȣ����ǵ��ֵܽ��ã����������ܾ��˿��ѣ����ɹŲ�ԭ�ϵ���ʿ�ǣ������ǣ�ΰ��ĳɼ�˼��ͳһ���ɹţ����ǳ��������¸ҵĶ��ӣ��������Ǵ��ϲ�ԭ���䱦������һ�����ƺʹ�����ģ�����������ģ�������ǰ�����ǣ���Щ������ģ�Ĺ������ǣ����ǻ������Ǵ󺹵����ģ����������˹�������Ȼ���Ĺ��ε����Ը����ǣ���Щ��Υ���˳������ּ�⣡\n \n    ���ڣ���Ҫ������ܳ�����ʿ��Ϊ�����ӣ�����Щ����������˵���Ѫ��������Ƭ��ɳĮ�ϣ��ú�ɳĮ��Ϊ���ǵ�ĹѨ�������ǵ�������ɱ����Щ������ģʿ�������������ϵ���ʿ֤���û�������֤�����ǵļ�ֵ��"  --��������
x205003_g_MissionTarget="    ɱ����Щ��#R������ģʿ��ͷĿ#W��30��45��������������ȡ��10ö#c0080C0��ʿ֤�������#W������#G�ٲ�̨#W������"		
x205003_g_MissionComplete="    �ԣ�������������ɳĮ�������ǵ�Ĺ�أ��������ǵģ�"					--�������npc˵���Ļ�
x205003_g_ContinueInfo="    ��ʿ֤�飬ֻ������ЩͷĿ���ϲ����ҵ���"
--������
x205003_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x205003_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x205003_g_RadioItemBonus={}

--MisDescEnd
x205003_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x205003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x205003_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x205003_g_MissionId) > 0 then
		if x205003_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x205003_g_MissionName)
			AddText(sceneId,x205003_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x205003_g_MissionTarget) 
			AddText(sceneId,format("\n    ��ʿ֤�������   %d/%d", LuaFnGetItemCount(sceneId,selfId,x205003_g_DemandItem[1].id),x205003_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x205003_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x205003_g_MissionName)
		     AddText(sceneId,x205003_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x205003_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x205003_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x205003_g_ScriptId, x205003_g_MissionId)
                end

        elseif x205003_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x205003_g_MissionName)
                AddText(sceneId,x205003_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x205003_g_MissionTarget) 
		AddMoneyBonus(sceneId, x205003_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x205003_g_ScriptId, x205003_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x205003_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x205003_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x205003_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x205003_g_ScriptId, x205003_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x205003_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x205003_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x205003_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==5) then
        	            	return 1
       	end
        return 0
	
end

--**********************************

--����

--**********************************

function x205003_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x205003_g_MissionId, x205003_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x205003_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x205003_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x205003_g_MissionId)
	for i, item in pairs(x205003_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x205003_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x205003_g_DemandItem[1].id) == x205003_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x205003_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x205003_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x205003_g_MissionId)
		AddExp(sceneId, selfId, x205003_g_ExpBonus)
		AddMoney(sceneId, selfId, x205003_g_MoneyBonus)
		for i, item in pairs(x205003_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x205003_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		--CallScriptFunction( x205003_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x205003_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x205003_g_MissionId) >= 0 then                                       
       		 if objdataId == x205003_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x205003_g_DemandItem[1].id) < x205003_g_DemandItem[1].num then
       		         if random(1,100)>30 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x205003_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("��ʿ֤�������   %d/%d", LuaFnGetItemCount(sceneId,selfId,x205003_g_DemandItem[1].id)+1,x205003_g_DemandItem[1].num )) 
				 	EndEvent()
				 	DispatchMissionTips(sceneId, selfId)
				 	AddItemListToHuman(sceneId,selfId) 
		        	 else                                                             
		        	 	BeginEvent(sceneId)                                      
				     	AddText(sceneId,"��Ʒ��������")                    
				        EndEvent(sceneId)                                        
				        DispatchMissionTips(sceneId,selfId) 
				 end                     
		         end             
       		    end
       		 end
       		 
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x205003_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x205003_OnItemChanged(sceneId, selfId, itemdataId)

end

